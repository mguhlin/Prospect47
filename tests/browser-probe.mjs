import { spawn } from 'node:child_process';
import { writeFile } from 'node:fs/promises';
import process from 'node:process';

const targetUrl = process.argv[2];
if (!targetUrl) {
  console.error('Usage: node tests/browser-probe.mjs <url>');
  process.exit(2);
}

const chrome = process.env.CHROME_BIN || 'google-chrome';
const port = 9337;
const chromeArgs = [
  '--headless', '--no-sandbox', '--disable-gpu',
  '--enable-features=WebAssemblyJSPI',
  `--remote-debugging-port=${port}`,
  '--remote-allow-origins=*',
];
if (process.env.P47_PROFILE_DIR) chromeArgs.push(`--user-data-dir=${process.env.P47_PROFILE_DIR}`);
chromeArgs.push(targetUrl);

const child = spawn(chrome, chromeArgs, {stdio: ['ignore', 'ignore', 'pipe']});

let browserErrors = '';
child.stderr.on('data', chunk => { browserErrors += chunk.toString(); });

const delay = ms => new Promise(resolve => setTimeout(resolve, ms));

async function findPage() {
  for (let attempt = 0; attempt < 40; attempt += 1) {
    try {
      const pages = await fetch(`http://127.0.0.1:${port}/json/list`).then(r => r.json());
      const page = pages.find(item => item.type === 'page' && item.url.startsWith('http'));
      if (page) return page;
    } catch {}
    await delay(250);
  }
  throw new Error('Chrome debugging endpoint did not become ready');
}

async function probe() {
  const page = await findPage();
  const socket = new WebSocket(page.webSocketDebuggerUrl);
  let nextId = 1;
  const pending = new Map();
  const runtimeErrors = [];
  socket.onmessage = event => {
    const message = JSON.parse(event.data);
    if (message.method === 'Runtime.exceptionThrown') {
      const details = message.params?.exceptionDetails;
      runtimeErrors.push(details?.exception?.description || details?.text || 'Unknown runtime exception');
    }
    if (message.method === 'Log.entryAdded' && message.params?.entry?.level === 'error') {
      runtimeErrors.push(message.params.entry.text);
    }
    if (!message.id || !pending.has(message.id)) return;
    pending.get(message.id)(message);
    pending.delete(message.id);
  };
  await new Promise((resolve, reject) => {
    socket.onopen = resolve;
    socket.onerror = reject;
  });

  const command = (method, params = {}) => new Promise(resolve => {
    const id = nextId++;
    pending.set(id, resolve);
    socket.send(JSON.stringify({id, method, params}));
  });
  const evaluate = async expression => {
    const response = await command('Runtime.evaluate', {expression, returnByValue: true, awaitPromise: true});
    if (response.result?.exceptionDetails) {
      throw new Error(response.result.exceptionDetails.exception?.description || response.result.exceptionDetails.text);
    }
    return response.result?.result?.value;
  };

  await command('Runtime.enable');
  await command('Log.enable');
  await command('Page.enable');
  let ready = false;
  for (let attempt = 0; attempt < 90; attempt += 1) {
    const text = await evaluate('document.body.innerText');
    if (text.includes('FATAL ERROR') || text.includes('Exception thrown')) {
      throw new Error(`WASM launcher failed:\n${text}`);
    }
    if (text.includes('READY!')) { ready = true; break; }
    await delay(1000);
  }
  if (!ready) throw new Error('WASM launcher did not become ready within 90 seconds');

  await evaluate("document.querySelector('#launch').click()");
  let canvasReady = false;
  let consoleText = '';
  for (let attempt = 0; attempt < 60; attempt += 1) {
    canvasReady = await evaluate("Boolean(document.querySelector('#canvas'))");
    consoleText = await evaluate("document.querySelector('#console_output')?.value || ''");
    if (/ERROR\[Main\]|ModError|AsyncifyError|Aborted\(|failed:|RuntimeError|Exception thrown/i.test(consoleText)) {
      throw new Error(`Luanti console reported an error:\n${consoleText}\n${runtimeErrors.join('\n')}`);
    }
    if (canvasReady && /Installed prospect47 successfully|Main menu|Game selected/i.test(consoleText)) break;
    await delay(1000);
  }
  if (!canvasReady) throw new Error('Luanti canvas was not activated');

  let persistenceReady = false;
  for (let attempt = 0; attempt < 30; attempt += 1) {
    const persistence = await evaluate('window.p47Persistence || null');
    if (persistence?.error) throw new Error(`Persistence initialization failed: ${persistence.error}`);
    if (persistence?.ready) { persistenceReady = true; break; }
    await delay(250);
  }

  if (process.env.P47_PERSIST_WRITE) {
    if (!persistenceReady) throw new Error('Persistent filesystem was not ready');
    const marker = JSON.stringify(process.env.P47_PERSIST_WRITE);
    await evaluate(`new Promise((resolve, reject) => {
      FS.writeFile('/Luanti/worlds/.p47-persistence-smoke', ${marker});
      FS.syncfs(false, error => error ? reject(error) : resolve(true));
    })`);
    console.log('PERSISTENCE_MARKER_WRITTEN=true');
  }

  if (process.env.P47_PERSIST_EXPECT) {
    if (!persistenceReady) throw new Error('Persistent filesystem was not ready');
    const actual = await evaluate("FS.readFile('/Luanti/worlds/.p47-persistence-smoke', { encoding: 'utf8' })");
    if (actual !== process.env.P47_PERSIST_EXPECT) {
      throw new Error(`Persistence marker mismatch: expected ${process.env.P47_PERSIST_EXPECT}, got ${actual}`);
    }
    console.log('PERSISTENCE_MARKER_RELOADED=true');
  }

  if (process.env.P47_EXPECT_OPFS === '1') {
    let mounted = false;
    for (let attempt = 0; attempt < 60; attempt += 1) {
      consoleText = await evaluate("document.querySelector('#console_output')?.value || ''");
      if (consoleText.includes('Failed to mount persistent OPFS worlds')) {
        throw new Error(`OPFS mount failed:\n${consoleText}`);
      }
      if (consoleText.includes('Mounted persistent OPFS worlds')) {
        mounted = true;
        break;
      }
      await delay(1000);
    }
    if (!mounted) throw new Error(`OPFS mount did not complete:\n${consoleText}`);
  }

  let inputChangedFrame = null;
  if (process.env.P47_INTERACTIVE === '1') {
    await delay(5000);
    const before = await command('Page.captureScreenshot', {format: 'png', captureBeyondViewport: false});
    await evaluate("document.querySelector('#canvas').focus()");
    await command('Input.dispatchKeyEvent', {
      type: 'rawKeyDown', key: 'w', code: 'KeyW', windowsVirtualKeyCode: 87,
      nativeVirtualKeyCode: 87,
    });
    await delay(3500);
    await command('Input.dispatchKeyEvent', {
      type: 'keyUp', key: 'w', code: 'KeyW', windowsVirtualKeyCode: 87,
      nativeVirtualKeyCode: 87,
    });
    await delay(1000);
    const after = await command('Page.captureScreenshot', {format: 'png', captureBeyondViewport: false});
    inputChangedFrame = before.result.data !== after.result.data;
    if (!inputChangedFrame) throw new Error('Keyboard input produced no rendered-frame change');
  }

  if (process.env.P47_EXPECT_OBJECTIVE) {
    const expected = `[p47_missions] objective=${process.env.P47_EXPECT_OBJECTIVE}`;
    let found = false;
    for (let attempt = 0; attempt < 30; attempt += 1) {
      consoleText = await evaluate("document.querySelector('#console_output')?.value || ''");
      if (consoleText.includes(expected)) { found = true; break; }
      await delay(500);
    }
    if (!found) throw new Error(`Expected persisted objective was not reported: ${expected}\n${consoleText}`);
    console.log(`MISSION_OBJECTIVE=${process.env.P47_EXPECT_OBJECTIVE}`);
  }

  if (process.env.P47_SAVE_WAIT_MS) {
    await delay(Number(process.env.P47_SAVE_WAIT_MS));
  }

  if (persistenceReady && (process.env.P47_INTERACTIVE === '1' || process.env.P47_PERSIST_WRITE)) {
    await evaluate(`new Promise((resolve, reject) => {
      FS.syncfs(false, error => error ? reject(error) : resolve(true));
    })`);
    console.log('PERSISTENCE_FLUSHED=true');
  }

  if (process.env.P47_SCREENSHOT) {
    const shot = await command('Page.captureScreenshot', {format: 'png', captureBeyondViewport: false});
    await writeFile(process.env.P47_SCREENSHOT, Buffer.from(shot.result.data, 'base64'));
  }

  console.log('WASM_READY=true');
  console.log('CANVAS_READY=true');
  if (inputChangedFrame !== null) console.log(`KEYBOARD_FRAME_CHANGED=${inputChangedFrame}`);
  console.log(consoleText.split('\n').slice(-20).join('\n'));
  socket.close();
}

try {
  await probe();
} finally {
  child.kill('SIGTERM');
}

if (browserErrors && /FATAL|WebAssembly\.CompileError|SharedArrayBuffer is not defined/i.test(browserErrors)) {
  console.error(browserErrors);
  process.exitCode = 1;
}

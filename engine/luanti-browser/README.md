# Luanti browser integration

Official upstream Luanti does not currently ship a documented browser build. Prospect 47 therefore evaluates the experimental [`paradust7/luanti-wasm`](https://github.com/paradust7/luanti-wasm) port as its Phase 0B proof-of-concept base.

## Pinned proof-of-concept revision

```text
Repository: https://github.com/paradust7/luanti-wasm.git
Revision:   69e94f3a43422f10f07a4e0630ff413be1354669
License:    MIT (wrapper); bundled/fetched dependencies retain their licenses
Status:     Experimental—not an official Luanti web distribution
```

The wrapper in turn pins a fork of Luanti. `scripts/fetch-luanti-wasm.sh` verifies the wrapper revision before leaving it in `engine/luanti-browser/vendor/`.

Prospect 47 applies three narrow compatibility patches: build zstd statically so libarchive links correctly under current Emscripten, replace an undefined pointer-lock helper with the standard browser API, and mount the worlds directory on IndexedDB-backed IDBFS. Without these, the wrapper can reject every `.pack`, crash on direct launch, or lose saves at page exit.

## Fetch

```bash
./engine/luanti-browser/scripts/fetch-luanti-wasm.sh
./engine/luanti-browser/scripts/bootstrap-tools.sh
./engine/luanti-browser/scripts/build-poc.sh
./engine/luanti-browser/scripts/package-prospect47.sh
```

## Build prerequisites

The upstream wrapper documents Ubuntu, `build-essential`, CMake, Tcl, Python, Git, wget, zip, zstd, and gettext. It installs and patches its own Emscripten SDK and requires Node 24.18 or newer. The bootstrap script installs checksum-pinned CMake and Node binaries inside this project; it does not modify the host system. The initial build is large and network-dependent.

Successful output is written to its `www/` directory. Do not commit generated engine binaries until their size, source notices, cache behavior, and release distribution method have been reviewed.

The packaging step creates a separate `prospect47.pack`, copies the complete runtime into ignored `engine/luanti-browser/dist/`, and leaves the pinned vendor checkout untouched. Start the isolated server at the repository root and open:

```text
http://127.0.0.1:8080/engine/luanti-browser/dist/?go=&gameid=prospect47&extra=--world,%2FLuanti%2Fworlds%2Fprospect47
```

## Required hosting behavior

The build uses WebAssembly threads and `SharedArrayBuffer`. Production hosting must return these headers for the game documents and worker resources:

```text
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```

It also requires WebGL2 and a browser capable of the port's Emscripten features. Plain `python3 -m http.server` is sufficient for the pre-engine launcher but **not** sufficient for this isolated WASM runtime. Use `scripts/serve-isolated.py` for local WASM testing.

After starting that server, run the repeatable Chrome interaction probe with the pinned project Node runtime:

```bash
./tests/browser-smoke.sh 8080
./tests/persistence-smoke.sh 8080
```

## Decision gate

Before adopting this fork, demonstrate:

- reliable build from the pinned revision;
- loading in current Chrome and Firefox;
- pointer lock, input, audio, Lua mods, digging, and placement;
- persistent worlds using browser storage;
- screenshot export;
- acceptable download size and memory use;
- a maintainable update path from upstream Luanti.

If any blocking item fails, evaluate a remote Luanti server with a browser-native client or a different browser-first voxel engine. Do not silently turn the experimental fork into a permanent dependency.

### Persistence design

The upstream port uses an in-memory WasmFS root. Prospect 47 switches the build to Emscripten's legacy filesystem and mounts only `/Luanti/worlds` on IDBFS, keeping engine and game packs out of browser storage. A startup run dependency blocks engine launch until IndexedDB hydration completes; IDBFS auto-persistence and lifecycle flushes write changes back. `tests/persistence-smoke.sh` verifies an explicit marker and Touchdown player metadata across two Chrome processes sharing one profile.

A direct OPFS mount was tested and rejected because the wrapper combines `PROXY_TO_PTHREAD` with JSPI; the synchronous OPFS backend suspended outside a `WebAssembly.promising` boundary and prevented world startup.

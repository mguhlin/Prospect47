(() => {
  'use strict';

  const SAVE_KEY = 'prospect47.touchdown.v1';
  const ENGINE_URL = '../../engine/luanti-browser/dist/?go=&gameid=prospect47&extra=--world,%2FLuanti%2Fworlds%2Fprospect47';
  const defaults = { x: 48, y: 72, moved: false, metScout: false, rock: 0, iron: 0, complete: false };
  let state = { ...defaults };
  const screens = ['launcher', 'mission', 'story'];
  const player = document.querySelector('#player');
  const interaction = document.querySelector('#interaction');
  const playArea = document.querySelector('#playArea');

  const readSave = () => {
    try { return JSON.parse(localStorage.getItem(SAVE_KEY)); }
    catch { return null; }
  };

  const save = (announce = false) => {
    localStorage.setItem(SAVE_KEY, JSON.stringify(state));
    if (announce) toast('Expedition saved locally');
  };

  const show = (name) => screens.forEach(id => { document.querySelector(`#${id}`).hidden = id !== name; });
  const distance = (a, b) => Math.hypot(a.x - b.x, a.y - b.y);
  const targets = {
    scout: { x: 61, y: 58 },
    iron: { x: 74, y: 73 },
    rock: { x: 27, y: 77 }
  };

  function toast(message) {
    const el = document.querySelector('#toast');
    el.textContent = message;
    el.classList.add('show');
    clearTimeout(toast.timer);
    toast.timer = setTimeout(() => el.classList.remove('show'), 1800);
  }

  function nearby() {
    return Object.entries(targets).find(([, target]) => distance(state, target) < 7)?.[0];
  }

  function update() {
    player.style.left = `${state.x}%`;
    player.style.top = `${state.y}%`;
    document.querySelector('#rockCount').textContent = state.rock;
    document.querySelector('#ironCount').textContent = state.iron;

    const completed = {
      move: state.moved,
      scout: state.metScout,
      rock: state.rock >= 3,
      iron: state.iron >= 2
    };
    const steps = [...document.querySelectorAll('#objectiveList li')];
    steps.forEach(li => {
      li.classList.toggle('done', completed[li.dataset.step]);
      li.classList.remove('active');
    });
    const next = steps.find(li => !completed[li.dataset.step]);
    if (next) next.classList.add('active');
    const count = Object.values(completed).filter(Boolean).length;
    document.querySelector('#progressBar').style.width = `${count * 25}%`;
    document.querySelector('#objectiveTitle').textContent = next ? next.textContent : 'Touchdown complete';

    const close = nearby();
    interaction.hidden = !close || close === 'scout';
    if (close === 'scout' && !state.metScout) {
      state.metScout = true;
      toast('SCOUT: Pathfinder link established. Let’s get to work.');
      save();
    }
    if (state.rock >= 3) document.querySelector('.rock-node').classList.add('depleted');
    if (state.iron >= 2) document.querySelector('.iron-node').classList.add('depleted');
    if (count === 4 && !state.complete) {
      state.complete = true;
      toast('Touchdown complete — Landing Zone secured');
      save();
    }
  }

  function start(fresh) {
    state = fresh ? { ...defaults } : { ...defaults, ...(readSave() || {}) };
    if (fresh) save();
    show('mission');
    update();
    playArea.focus();
  }

  function move(dx, dy) {
    state.x = Math.max(4, Math.min(96, state.x + dx));
    state.y = Math.max(16, Math.min(92, state.y + dy));
    state.moved = true;
    update();
    save();
  }

  function interact() {
    const close = nearby();
    if (close === 'rock' && state.rock < 3) { state.rock += 1; toast('+1 regolith'); }
    if (close === 'iron' && state.iron < 2) { state.iron += 1; toast('+1 iron'); }
    update();
    save();
  }

  document.addEventListener('keydown', event => {
    if (document.querySelector('#mission').hidden) return;
    const moves = { w: [0,-2], arrowup: [0,-2], s: [0,2], arrowdown: [0,2], a: [-2,0], arrowleft: [-2,0], d: [2,0], arrowright: [2,0] };
    const key = event.key.toLowerCase();
    if (moves[key]) { event.preventDefault(); move(...moves[key]); }
    if (key === 'e') interact();
  });

  document.querySelector('#newButton').addEventListener('click', () => start(true));
  document.querySelector('#engineButton').addEventListener('click', () => { window.location.href = ENGINE_URL; });
  document.querySelector('#continueButton').addEventListener('click', () => start(false));
  document.querySelector('#storyButton').addEventListener('click', () => show('story'));
  document.querySelector('#saveButton').addEventListener('click', () => save(true));
  document.querySelector('.backButton').addEventListener('click', () => show('launcher'));
  document.querySelectorAll('.resource').forEach(el => el.addEventListener('click', () => { const target = targets[el.dataset.resource]; state.x = target.x; state.y = target.y; update(); interact(); }));

  document.querySelector('#continueButton').hidden = !readSave();

  fetch('../../engine/luanti-browser/dist/index.html', {method: 'HEAD'})
    .then(response => { document.querySelector('#engineButton').hidden = !response.ok; })
    .catch(() => {});
})();

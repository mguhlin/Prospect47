# Prospect 47

**Dig. Craft. Build. Prepare for Tomorrow.**

Prospect 47 is a browser-first asteroid mining and colony-building game built on an experimental WebAssembly port of the open-source Luanti engine. This repository contains the design bible, concept art, phased roadmap, launcher prototype, game modules, and a packaged playable browser alpha.

## Run the prototype

No dependencies or build step are required:

```bash
python3 -m http.server 8080
```

Open <http://localhost:8080/web/launcher/>.

The lightweight launcher prototype simulates the opening Touchdown mission and stores that simulation in local browser storage. When the packaged engine is present, its **Launch engine alpha** button starts the actual Luanti world directly. The real engine alpha renders the world, accepts movement, and persists its world and mission data in browser IndexedDB.

For the experimental threaded WASM build, use the cross-origin-isolated server and follow the pinned integration notes in `engine/luanti-browser/README.md`:

```bash
python3 engine/luanti-browser/scripts/serve-isolated.py . --port 8080
```

## Gameplay so far

The native Luanti game now covers the Touchdown slice and the groundwork for the
Prospector geology loop:

- **Layered asteroid geology** — regolith, rock, and depth-gated iron, copper,
  silicon, titanium, and water-ice deposits, with a copper/silicon **Survey
  Ridge** and a buried violet **Aetherium anomaly**.
- **Mining and refining** — the Pathfinder Field Pick mines ore; shapeless
  recipes refine it into chunks, wafers, ingots, and water canisters.
- **Advanced Geological Scanner** — reports nearby deposits, detects the buried
  anomaly, and drops a persistent map waypoint. Survey markers lock a grid.
- **Buildable gear** — a working Storage Crate container and a Communications
  Beacon, plus a SpaceCam for photo missions.
- **Data-driven campaign** — Mission 01 Touchdown and Mission 02 Survey Ridge
  track objectives in player metadata that persist across browser reloads, with
  a context-aware Scout companion.

## Current status

- [x] Preserve the game/story design source
- [x] Establish repository layout and phased roadmap
- [x] Create a dependency-free launcher/mission prototype
- [x] Add automated smoke tests for the static prototype
- [x] Reproduce a browser-capable Luanti 5.16.1 WebAssembly build
- [x] Native Prospect 47 modules: terrain, resources, tools, Scout, missions
- [x] Package and install the Prospect 47 game inside the browser engine
- [x] Validate world rendering and keyboard movement in Chrome
- [x] Implement and reload-test browser-backed world and mission persistence
- [x] Phase 2 groundwork: scanner, new ores, Survey Ridge, anomaly, SpaceCam,
      data-driven missions
- [ ] Complete Firefox and remaining gameplay validation
- [ ] Runtime-validate the Phase 2 loop end-to-end in the browser engine

See [docs/ROADMAP.md](docs/ROADMAP.md) for sequencing and acceptance gates, and
[CHANGELOG.md](CHANGELOG.md) for a per-release summary.

## Project map

```text
engine/               Luanti browser integration (Phase 0); build artifacts gitignored
game/                 Prospect 47 Luanti game and p47_* mods
  mods/p47_core       Player setup, colors, HUD/waypoint helpers
  mods/p47_world      Layered asteroid mapgen, Survey Ridge, anomaly
  mods/p47_resources  Ore nodes, refined items, storage crate, beacon
  mods/p47_tools      Pathfinder Field Pick and starter kit
  mods/p47_scanner    Geological scanner, survey markers, waypoints
  mods/p47_spacecam   SpaceCam photo tool
  mods/p47_scout      Scout companion and dialogue
  mods/p47_missions   Data-driven campaign engine
web/launcher/         Browser launcher and current prototype
proxy/                Future multiplayer bridge
tests/                Automated checks
docs/                 Roadmap and technical decisions
LICENSES/             Project and third-party licensing records
```

The concept images are visual-direction references. They are not engine screenshots or final production assets.

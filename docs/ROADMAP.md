# Prospect 47 Delivery Roadmap

This roadmap converts the broad design bible into gated, testable releases. Work only advances when the current gate is demonstrated; later systems should not be built on an unproven browser engine.

## Phase 0A — Project foundation (complete)

**Outcome:** A navigable repository with a runnable, testable product shell.

- Establish the engine/game/web/docs/tests separation.
- Record scope, architecture decisions, and licensing placeholders.
- Build a dependency-free launcher prototype using the current visual direction.
- Add a static smoke test and local run instructions.

**Gate:** A new contributor can serve the repository, open the launcher, start Touchdown, move, collect resources, and reload saved progress.

## Phase 0B — Browser engine feasibility (in progress, blocking)

**Outcome:** An upstream-compatible Luanti WebAssembly proof of concept.

1. Pin the Luanti source revision and document its license/build toolchain.
2. Reproduce a minimal browser build without Prospect 47 content.
3. Verify rendering, keyboard, pointer lock, audio, and Lua execution.
4. Prove IndexedDB or OPFS persistence across reloads.
5. Verify digging, placement, inventory, and screenshot capture.
6. Record Chrome, Firefox, Edge, and Safari results in `docs/BROWSER_MATRIX.md`.

**Gate:** A test world passes the complete browser feasibility checklist on Chrome and Firefox, with no blocking console errors. Other browsers may be documented as provisional.

**Current result (2026-08-07):** The official Luanti tree does not expose a supported top-level browser build. The experimental `paradust7/luanti-wasm` wrapper is pinned and builds locally with project-scoped CMake and Node toolchains. Chrome probes verify WASM initialization, canvas activation, pack installation, direct world startup, Lua rendering, keyboard movement, screenshot capture, and IndexedDB persistence across separate browser processes. The advanced Touchdown objective survives reload. The build requires static-zstd, pointer-lock, and IDBFS compatibility patches and reserves roughly 1.875 GiB of initial WASM memory. Trusted pointer lock, audio, digging/placement, Firefox, and the other browser checks remain blocking.

## Phase 1 — Touchdown / v0.1

**Outcome:** The smallest real Luanti build that feels like Prospect 47.

- Add `p47_core`, `p47_world`, `p47_resources`, `p47_tools`, `p47_scout`, and `p47_missions` modules.
- Generate one compact asteroid test area and a Wayfarer landing site.
- Add original rock and iron nodes, one mining tool, placement, and inventory.
- Introduce Scout and the first four objectives.
- Route engine launch/continue actions through the web launcher.
- Persist terrain and mission state locally.

**Gate:** Start beside Wayfarer, meet Scout, mine iron, place a block, reload the browser, and retain both terrain and mission progress.

**In progress:** The initial `p47_core`, `p47_world`, `p47_resources`, `p47_tools`, `p47_scout`, and `p47_missions` Lua modules define a compact asteroid, landing platform, original resource nodes/textures, starter tool, Scout placeholder, and Touchdown objectives. Chrome runtime validation reaches the world, advances the first objective through keyboard movement, saves through IDBFS, and restores that mission state in a new browser process. Digging, block placement, and retained terrain changes are the next gameplay checks.

**Touchdown expansion (2026-08-16):** Touchdown now includes the storage-crate and communications-beacon objectives from the design bible. The Storage Crate is a working container, the Beacon is a buildable light/objective node craftable from landing-zone iron and copper, and the First Footprints photo mission is recognized via SpaceCam. These paths still need browser runtime validation.

## Phase 2 — Prospector / v0.2

**Outcome:** Exploration becomes a deliberate geology loop.

- Scanner, copper, silicon, titanium, and water ice.
- Survey Ridge, waypoints, anomaly signal, and data-driven mission UI.
- First usable SpaceCam screenshot flow.

**Gate:** Scan three resources, locate ice, reach Survey Ridge, trigger the anomaly, take a screenshot, and resume saved progress.

**In progress (2026-08-16):** The geology loop is implemented in the native game. `p47_world` distributes iron, copper, silicon, titanium, and clustered water ice by depth, raises a copper/silicon-rich Survey Ridge, and buries the violet Aetherium anomaly in the core. `p47_scanner` adds the Advanced Geological Scanner (deposit report + anomaly detection + persistent waypoint) and craftable survey markers; `p47_spacecam` adds the SpaceCam photo tool. `p47_missions` was rebuilt as a data-driven engine and now ships Mission 02 Survey Ridge (reach the ridge, raise three markers, scan, map deposits, locate ice, mark the anomaly, build a relay). Browser runtime validation of the full Phase 2 loop, plus data-driven mission UI in the launcher, remain open.

## Phase 3 — Industrial / v0.3

**Outcome:** Raw extraction becomes an industrial production loop.

- Iron Hollow, power network, crusher, refinery, and fabricator.
- Recipes defined as data with validation and clear energy costs.
- Powered mining and equipment failure feedback.

**Gate:** Mine ore and turn it into a fabricated habitat component through powered machines.

## Phase 4 — Discovery / v0.4

**Outcome:** Aetherium provides the first narrative and mechanical surprise.

- Crystal Cavern, analyzer, containment, Aetherium nodes, and research event.
- Distinct audiovisual language and safe handling rules.

**Gate:** Follow the signal, discover and analyze Aetherium, and unlock the habitat objective.

## Phase 5 — Home / v0.5

**Outcome:** Construction has functional consequences.

- Modular habitat, dome, oxygen, water, power, airlock, and completion checks.
- “Home” photo mission and visible build-state feedback.

**Gate:** Build and pressurize a safe habitat entirely from processed resources.

## Phase 6 — Horizon / v0.6

**Outcome:** Campaign One resolves with a populated colony.

- Aetherium Core production, arrival countdown, Horizon sequence, and initial NPCs.
- Colony routines and campaign completion state.

**Gate:** Power the beacon, welcome colonists, save, reload, and find the living colony intact.

## Later releases

- **v0.7 Belt:** additional asteroids and space travel.
- **v0.8 Workshop:** carefully sandboxed local mod manager and SDK.
- **v0.9 Together:** private cooperative multiplayer after reliable single-player.
- **v1.0 A New Frontier:** accessibility, performance, compatibility, content, legal, and release-candidate gates.

## Scope controls

- Browser engine feasibility is the blocking technical risk.
- Multiplayer and unrestricted mods stay out until single-player persistence is reliable.
- Concept art guides palette and tone; it is not a promise of in-engine fidelity.
- Each release must be playable end-to-end before adding the next location.
- Original assets and known licenses are required for every shipped file.

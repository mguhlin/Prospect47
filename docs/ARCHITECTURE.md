# Architecture Decisions

## ADR-001: Keep the game outside the engine fork

**Decision:** Prospect 47 gameplay lives in `game/mods/p47_*`. Browser integration and upstream patches live under `engine/luanti-browser`.

**Reason:** The WASM port is experimental, while Luanti's Lua API is the most portable seam. Keeping game rules out of the fork reduces migration and update cost.

## ADR-002: Treat the WASM port as a gate, not a commitment

**Decision:** Pin and test `paradust7/luanti-wasm` for Phase 0B. Do not vendor generated binaries or promise browser support until the matrix passes.

**Evidence:** Current upstream Luanti contains Emscripten support in its Irrlicht rendering layer but no documented top-level web build. The external port supplies the missing build, filesystem, networking, and launcher work.

**Consequences:** The browser build requires special headers, WebGL2, threaded WASM support, substantial memory, and a fork maintenance plan. A failed gate triggers an engine/client architecture review.

## ADR-003: Separate the product shell from engine loading

**Decision:** `web/launcher` owns marketing, save selection, story navigation, compatibility reporting, and engine launch. The engine will mount inside a dedicated game screen when available.

**Reason:** The launcher stays useful if the engine implementation changes and provides a graceful place to report unsupported browsers.

## ADR-004: Data-driven, metadata-backed missions

**Decision:** Missions are declared as data in `p47_missions` — a list of
missions, each with a `code`, `title`, `on_start`/`on_complete` hooks, and an
`objectives(meta)` function that derives objective state from player metadata.
Progress counters live in player metadata and are updated by `on_dignode`,
`on_placenode`, proximity checks, and the scanner.

**Reason:** Player metadata is what Luanti persists to the world, so reading
objectives straight from it makes progress survive browser reloads for free.
Declaring missions as data keeps each new campaign area an append rather than a
rewrite, and decouples the mission engine from the mods that produce progress
(scanner, SpaceCam) via shared `p47` helpers and optional dependencies.

**Consequences:** Objective checks must stay cheap because they are evaluated on
a timer; genuinely event-driven state (scanning, photos) is recorded to metadata
by the producing mod and merely read back here.


# Changelog

All notable changes to Prospect 47 are recorded here. This project follows the
phased roadmap in `docs/ROADMAP.md`; versions map to roadmap phases.

## [0.2.0-dev] — Prospector groundwork

Advances the native Luanti game from the Touchdown slice toward Phase 2
(Prospector / v0.2): a deliberate geology loop.

### Added

- **New resources:** copper, silicon, titanium, and water-ice ore nodes, each
  with original textures and hand-refining recipes producing copper chunks,
  silicon wafers, titanium ingots, and water canisters.
- **Layered geology:** the asteroid mapgen now distributes ores by depth so
  descent is rewarded, adds a copper- and silicon-rich **Survey Ridge** to the
  north-east, and buries the violet **Aetherium anomaly** in the core.
- **Advanced Geological Scanner** (`p47_scanner`): reports nearby deposits by
  type, detects the buried anomaly, and drops a persistent map waypoint.
- **Survey markers:** placeable, glowing posts used to lock a survey grid.
- **SpaceCam** (`p47_spacecam`): an in-world camera that frames photo missions
  and notifies missions of what was captured (First Footprints).
- **Buildable station gear:** a functional **Storage Crate** container and a
  craftable **Communications Beacon** light/objective node.
- **Shared HUD helpers** in `p47_core`: named waypoints and status messages.
- Repository licensing set (`LICENSE`, `LICENSES/*`), asset inventory,
  `CHANGELOG.md`, and a root `.gitignore` excluding engine build artifacts.

### Changed

- **Missions are now data-driven** (`p47_missions`): a table of missions with
  metadata-backed objectives that persist across reloads. Ships Mission 01
  Touchdown (now including crate and beacon objectives) and Mission 02 Survey
  Ridge (markers, scanning, mapping, ice, anomaly, relay), with reward and
  Mission Control messaging on completion.
- **Scout** speaks context-aware lines that change with campaign progress.
- New players receive the scanner, survey markers, and SpaceCam alongside the
  field pick and landing plates.

## [0.1.0] — Touchdown

Initial playable slice: compact asteroid, regolith/rock/iron nodes, the
Pathfinder Field Pick, the Scout companion, and the Touchdown mission, with
browser world and mission persistence validated in Chrome.

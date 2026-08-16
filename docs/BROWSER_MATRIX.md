# Browser Feasibility Matrix

Status values: Not tested, Pass, Partial, Fail.

| Feature | Chrome | Firefox | Edge | Safari |
|---|---|---|---|---|
| Launcher loads | Pass | Not tested | Not tested | Not tested |
| Luanti/WASM loads | Pass (headless) | Not tested | Not tested | Not tested |
| Prospect 47 pack installs | Pass | Not tested | Not tested | Not tested |
| Game world and Lua mods render | Pass | Not tested | Not tested | Not tested |
| Keyboard movement advances objective | Pass | Not tested | Not tested | Not tested |
| World and mission survive reload | Pass (IndexedDB) | Not tested | Not tested | Not tested |
| Keyboard input | Pass (headless) | Not tested | Not tested | Not tested |
| Pointer capture | Partial (API path; headless cannot grant trusted lock) | Not tested | Not tested | Not tested |
| Audio | Not integrated | Not integrated | Not integrated | Not integrated |
| Dig/place | Not integrated | Not integrated | Not integrated | Not integrated |
| Save/reload | Pass (automated two-process test) | Not tested | Not tested | Not tested |
| Screenshot | Pass (headless capture) | Not tested | Not tested | Not tested |
| Fullscreen | Not integrated | Not integrated | Not integrated | Not integrated |

## Chrome evidence — 2026-08-07

- Environment: Google Chrome headless on Debian 13, isolated localhost origin.
- Luanti: 5.16.1 via pinned `paradust7/luanti-wasm` revision.
- Emscripten: 6.0.4 with JSPI enabled.
- Result: WASM initialized, canvas activated, base pack and `prospect47.pack` installed, the Touchdown world rendered, and simulated W input changed the frame and advanced the objective from Wayfarer to Scout.
- Automated probes: `tests/browser-smoke.sh` and `tests/persistence-smoke.sh`.

Persistence uses Emscripten's legacy filesystem with `/Luanti/worlds` mounted on IDBFS. Startup hydration is guarded by a run dependency, file mutations auto-persist, and visibility/unload hooks request a final flush. The automated test starts two separate Chrome processes with the same browser profile and verifies both an explicit filesystem marker and the advanced `Approach Scout` mission state after reloading. A direct WasmFS/OPFS mount was rejected because asynchronous OPFS suspension conflicts with the wrapper's JSPI plus proxied-pthread execution model.

This is still an automated headless pass. Trusted pointer-lock interaction, audio, digging, placement, fullscreen, Firefox, Edge, and Safari remain unverified.

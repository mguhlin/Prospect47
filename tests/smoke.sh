#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required=(
  "$root_dir/web/launcher/index.html"
  "$root_dir/web/launcher/styles.css"
  "$root_dir/web/launcher/app.js"
  "$root_dir/docs/ROADMAP.md"
  "$root_dir/game/game.conf"
  "$root_dir/game/mods/p47_world/init.lua"
  "$root_dir/game/mods/p47_missions/init.lua"
  "$root_dir/engine/luanti-browser/scripts/fetch-luanti-wasm.sh"
  "$root_dir/engine/luanti-browser/scripts/bootstrap-tools.sh"
  "$root_dir/engine/luanti-browser/scripts/build-poc.sh"
  "$root_dir/engine/luanti-browser/scripts/package-prospect47.sh"
  "$root_dir/engine/luanti-browser/scripts/serve-isolated.py"
  "$root_dir/tests/browser-smoke.sh"
  "$root_dir/tests/persistence-smoke.sh"
)

for file in "${required[@]}"; do
  test -s "$file"
done

grep -q 'id="launcher"' "$root_dir/web/launcher/index.html"
grep -q 'id="mission"' "$root_dir/web/launcher/index.html"
grep -q 'localStorage' "$root_dir/web/launcher/app.js"
grep -q 'Phase 0B' "$root_dir/docs/ROADMAP.md"
grep -q 'register_on_generated' "$root_dir/game/mods/p47_world/init.lua"
grep -q 'expected_revision=' "$root_dir/engine/luanti-browser/scripts/fetch-luanti-wasm.sh"
grep -q 'WASM_READY=true' "$root_dir/tests/browser-probe.mjs"

echo "Prospect 47 static smoke test passed"

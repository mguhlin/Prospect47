#!/usr/bin/env bash
# Static integrity check for the native Prospect 47 Luanti game content:
# every mod is present, and every texture referenced from Lua exists on disk.
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mods_dir="$root_dir/game/mods"

mods=(
  p47_core p47_world p47_resources p47_tools
  p47_scanner p47_spacecam p47_scout p47_missions
)

for mod in "${mods[@]}"; do
  test -s "$mods_dir/$mod/init.lua"
  test -s "$mods_dir/$mod/mod.conf"
done

# Key Phase 2 systems must be wired up.
grep -q '"copper_ore"' "$mods_dir/p47_resources/init.lua"
grep -q '"water_ice"' "$mods_dir/p47_resources/init.lua"
grep -q 'p47_resources:aetherium_signal' "$mods_dir/p47_world/init.lua"
grep -q 'survey_ridge' "$mods_dir/p47_world/init.lua"
grep -q 'register_tool("p47_scanner:scanner"' "$mods_dir/p47_scanner/init.lua"
grep -q 'register_tool("p47_spacecam:spacecam"' "$mods_dir/p47_spacecam/init.lua"
grep -q 'MISSION 02' "$mods_dir/p47_missions/init.lua"
grep -q 'set_waypoint' "$mods_dir/p47_core/init.lua"

# Every texture named in Lua must exist somewhere under the mods tree.
missing=0
while read -r tex; do
  if ! find "$mods_dir" -name "$tex" | grep -q .; then
    echo "MISSING TEXTURE: $tex"
    missing=1
  fi
done < <(grep -rhoE '[a-z0-9_]+\.png' "$mods_dir"/*/init.lua | sort -u)
test "$missing" -eq 0

echo "Prospect 47 game content check passed"

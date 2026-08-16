#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
engine_dir="$(cd "$script_dir/.." && pwd)"
project_root="$(cd "$engine_dir/../.." && pwd)"
wrapper_dir="$engine_dir/vendor/luanti-wasm"
www_dir="$wrapper_dir/www"
staging_dir="$(mktemp -d "$engine_dir/.package-staging.XXXXXX")"
game_source="$project_root/game"
release_dir="$(find "$www_dir" -mindepth 1 -maxdepth 1 -type d -print -quit)"

if [[ ! -s "$www_dir/index.html" || ! -d "$release_dir/packs" ]]; then
  echo "WASM distribution is missing; run scripts/build-poc.sh first." >&2
  exit 1
fi

mkdir -p "$staging_dir/luanti/games"
target_game="$staging_dir/luanti/games/prospect47"
cp -a "$game_source" "$target_game"
find "$target_game" -type f -name '*.md' -delete

tar -C "$staging_dir" -cf "$staging_dir/prospect47.tar" luanti/games/prospect47
zstd --force -19 "$staging_dir/prospect47.tar" -o "$release_dir/packs/prospect47.pack"

mkdir -p "$engine_dir/dist"
# dist is generated, ignored output. Clear stale release UUID directories so
# the measured/deployed artifact contains exactly one engine release.
find "$engine_dir/dist" -mindepth 1 -depth -delete
cp -a "$www_dir/." "$engine_dir/dist/"

pack_size="$(du -h "$release_dir/packs/prospect47.pack" | cut -f 1)"
echo "Packaged Prospect 47 ($pack_size): $engine_dir/dist"
echo "Launch URL: /engine/luanti-browser/dist/?gameid=prospect47"

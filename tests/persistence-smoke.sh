#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
node_bin="$root_dir/engine/luanti-browser/.tools/node-v24.19.0-linux-x64/bin/node"
port="${1:-8080}"
profile_dir="$(mktemp -d -t prospect47-chrome-profile.XXXXXX)"
marker="prospect47-indexeddb-$RANDOM-$RANDOM"
url="http://127.0.0.1:${port}/engine/luanti-browser/dist/?go=&gameid=prospect47&extra=--world,%2FLuanti%2Fworlds%2Fprospect47"

cleanup() {
  rm -rf -- "$profile_dir"
}
trap cleanup EXIT

P47_PROFILE_DIR="$profile_dir" P47_PERSIST_WRITE="$marker" P47_INTERACTIVE=1 \
  P47_EXPECT_OBJECTIVE="Approach Scout" P47_SAVE_WAIT_MS=17000 \
  "$node_bin" "$root_dir/tests/browser-probe.mjs" "$url"
P47_PROFILE_DIR="$profile_dir" P47_PERSIST_EXPECT="$marker" \
  P47_EXPECT_OBJECTIVE="Approach Scout" \
  "$node_bin" "$root_dir/tests/browser-probe.mjs" "$url"

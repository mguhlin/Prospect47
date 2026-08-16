#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
node_bin="$root_dir/engine/luanti-browser/.tools/node-v24.19.0-linux-x64/bin/node"
port="${1:-8080}"

if [[ ! -x "$node_bin" ]]; then
  echo "Pinned Node runtime is missing; run engine/luanti-browser/scripts/bootstrap-tools.sh first." >&2
  exit 1
fi

url="http://127.0.0.1:${port}/engine/luanti-browser/dist/?go=&gameid=prospect47&extra=--world,%2FLuanti%2Fworlds%2Fprospect47"
P47_INTERACTIVE=1 "$node_bin" "$root_dir/tests/browser-probe.mjs" "$url"

#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
engine_dir="$(cd "$script_dir/.." && pwd)"
wrapper_dir="$engine_dir/vendor/luanti-wasm"
tools_dir="$engine_dir/.tools"
logs_dir="$engine_dir/build-logs"
cmake_bin="$(find "$tools_dir" -maxdepth 3 -type f -path '*/bin/cmake' -print -quit)"
node_bin="$(find "$tools_dir" -maxdepth 3 -type f -path '*/bin/node' -print -quit)"

if [[ ! -x "$cmake_bin" ]]; then
  echo "Local CMake is missing; run scripts/bootstrap-tools.sh first." >&2
  exit 1
fi

if [[ ! -x "$node_bin" ]]; then
  echo "Local Node.js is missing; run scripts/bootstrap-tools.sh first." >&2
  exit 1
fi

if [[ ! -x "$wrapper_dir/build_all.sh" ]]; then
  echo "Pinned luanti-wasm checkout is missing; run scripts/fetch-luanti-wasm.sh first." >&2
  exit 1
fi

mkdir -p "$logs_dir"
export PATH="$(dirname "$node_bin"):$(dirname "$cmake_bin"):$PATH"

log_file="$logs_dir/build-$(date -u +%Y%m%dT%H%M%SZ).log"
echo "Building pinned luanti-wasm; log: $log_file"
(
  cd "$wrapper_dir"
  ./build_all.sh
) 2>&1 | tee "$log_file"

test -s "$wrapper_dir/www/index.html"
echo "Build completed: $wrapper_dir/www"

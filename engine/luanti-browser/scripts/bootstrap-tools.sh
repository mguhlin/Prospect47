#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
engine_dir="$(cd "$script_dir/.." && pwd)"
tools_dir="$engine_dir/.tools"
cmake_version="4.4.2"
archive="cmake-${cmake_version}-linux-x86_64.tar.gz"
expected_sha256="3ada9a3f5d8a85413579bdd0ea6aa8e8da86efdd6d15c91a1afa517f2021956c"
download_url="https://github.com/Kitware/CMake/releases/download/v${cmake_version}/${archive}"
archive_path="$tools_dir/$archive"
cmake_dir="$tools_dir/cmake-${cmake_version}-linux-x86_64"
node_version="24.19.0"
node_archive="node-v${node_version}-linux-x64.tar.xz"
node_expected_sha256="14b342e71204f811bde6153be8e04b62aef63c236fef92b55f9c83154b409647"
node_download_url="https://nodejs.org/dist/v${node_version}/${node_archive}"
node_archive_path="$tools_dir/$node_archive"
node_dir="$tools_dir/node-v${node_version}-linux-x64"

mkdir -p "$tools_dir"

if [[ ! -x "$cmake_dir/bin/cmake" ]]; then
  if [[ ! -f "$archive_path" ]]; then
    curl --fail --location --retry 3 "$download_url" --output "$archive_path"
  fi
  actual_sha256="$(sha256sum "$archive_path" | cut -d ' ' -f 1)"
  if [[ "$actual_sha256" != "$expected_sha256" ]]; then
    echo "CMake checksum mismatch: $actual_sha256" >&2
    exit 1
  fi
  tar -xzf "$archive_path" -C "$tools_dir"
fi

"$cmake_dir/bin/cmake" --version | head -n 1

if [[ ! -x "$node_dir/bin/node" ]]; then
  if [[ ! -f "$node_archive_path" ]]; then
    curl --fail --location --retry 3 "$node_download_url" --output "$node_archive_path"
  fi
  node_actual_sha256="$(sha256sum "$node_archive_path" | cut -d ' ' -f 1)"
  if [[ "$node_actual_sha256" != "$node_expected_sha256" ]]; then
    echo "Node.js checksum mismatch: $node_actual_sha256" >&2
    exit 1
  fi
  tar -xJf "$node_archive_path" -C "$tools_dir"
fi

"$node_dir/bin/node" --version

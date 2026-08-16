#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
engine_dir="$(cd "$script_dir/.." && pwd)"
patch_files=(
  "$engine_dir/patches/0001-static-zstd-for-libarchive.patch"
  "$engine_dir/patches/0002-browser-pointer-lock.patch"
  "$engine_dir/patches/0003-indexeddb-world-persistence.patch"
)
vendor_dir="$engine_dir/vendor"
checkout_dir="$vendor_dir/luanti-wasm"
repo_url="https://github.com/paradust7/luanti-wasm.git"
expected_revision="69e94f3a43422f10f07a4e0630ff413be1354669"

mkdir -p "$vendor_dir"

if [[ ! -d "$checkout_dir/.git" ]]; then
  if [[ -e "$checkout_dir" ]]; then
    echo "Refusing to overwrite non-Git path: $checkout_dir" >&2
    exit 1
  fi
  git clone "$repo_url" "$checkout_dir"
fi

actual_remote="$(git -C "$checkout_dir" remote get-url origin)"
if [[ "$actual_remote" != "$repo_url" ]]; then
  echo "Unexpected origin: $actual_remote" >&2
  exit 1
fi

git -C "$checkout_dir" fetch --depth 1 origin "$expected_revision"
git -C "$checkout_dir" checkout --detach "$expected_revision"
actual_revision="$(git -C "$checkout_dir" rev-parse HEAD)"

if [[ "$actual_revision" != "$expected_revision" ]]; then
  echo "Revision verification failed: $actual_revision" >&2
  exit 1
fi

for patch_file in "${patch_files[@]}"; do
  if git -C "$checkout_dir" apply --check "$patch_file"; then
    git -C "$checkout_dir" apply "$patch_file"
  elif git -C "$checkout_dir" apply --reverse --check "$patch_file"; then
    echo "Compatibility patch already applied: $(basename "$patch_file")"
  else
    echo "Compatibility patch does not apply cleanly: $patch_file" >&2
    exit 1
  fi
done

echo "Verified luanti-wasm at $actual_revision"

#!/usr/bin/env bash
set -euo pipefail

JSON="repo_urls.json"
OUT_DIR="zips"
JOBS=$(command -v nproc >/dev/null && nproc || sysctl -n hw.ncpu)

mkdir -p "$OUT_DIR"

jq -r '.repositories[]' "$JSON" | xargs -P "$JOBS" -n 1 bash -lc '
  url="$0"
  name=$(basename "$url")
  tmp=$(mktemp -d)
  git clone --quiet --depth=1 "$url" "$tmp/$name" || { rm -rf "$tmp"; exit 0; }
  (cd "$tmp" && zip -qr "$OLDPWD/'"$OUT_DIR"'/$name.zip" "$name")
  rm -rf "$tmp"
'
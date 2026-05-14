#!/usr/bin/env bash
set -euo pipefail

# Usage: ./tools/build.sh [doc_name]
#   doc_name — name of a folder under docs/ to build (builds all if omitted)

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
QUARTO_IMAGE="ghcr.io/quarto-dev/quarto:latest"

if ! command -v docker &>/dev/null; then
  echo "Error: docker is not installed or not in PATH." >&2
  exit 1
fi

# Resolve the list of docs to build
if [ $# -gt 0 ]; then
  doc_names=("$1")
else
  shopt -s nullglob
  doc_names=()
  for d in "$ROOT/docs"/*/; do
    doc_names+=("$(basename "$d")")
  done
fi

if [ ${#doc_names[@]} -eq 0 ]; then
  echo "No document folders found in docs/." >&2
  exit 1
fi

for doc_name in "${doc_names[@]}"; do
  doc_dir="$ROOT/docs/$doc_name"

  if [ ! -d "$doc_dir" ]; then
    echo "Error: docs/$doc_name/ does not exist." >&2
    exit 1
  fi

  if [ -f "$doc_dir/index.qmd" ]; then
    entry="index.qmd"
  elif [ -f "$doc_dir/$doc_name.md" ]; then
    entry="$doc_name.md"
  else
    echo "Error: no index.qmd or $doc_name.md found in docs/$doc_name/." >&2
    exit 1
  fi

  echo "Rendering: $doc_name ($entry)"

  docker run --rm --platform linux/amd64 \
    -v "$ROOT:/workspace" \
    -w "/workspace/docs/$doc_name" \
    "$QUARTO_IMAGE" \
    quarto render "$entry"

  echo "  → dist/$doc_name/"
done

echo ""
echo "Build complete → dist/"

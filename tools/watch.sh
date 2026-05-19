#!/usr/bin/env bash
set -euo pipefail

# Usage: ./tools/watch.sh [doc_name]
#   doc_name — folder under sites/ to preview (default: code_connect_summit_2026)

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
QUARTO_IMAGE="ghcr.io/quarto-dev/quarto:latest"
DOC="${1:-code_connect_summit_2026}"
DOC_DIR="$ROOT/sites/$DOC"

if ! command -v docker &>/dev/null; then
  echo "Error: docker is not installed or not in PATH." >&2
  exit 1
fi

if [ ! -d "$DOC_DIR" ]; then
  echo "Error: sites/$DOC/ does not exist." >&2
  exit 1
fi

if [ -f "$DOC_DIR/index.qmd" ]; then
  entry="index.qmd"
elif [ -f "$DOC_DIR/$DOC.md" ]; then
  entry="$DOC.md"
else
  echo "Error: no index.qmd or $DOC.md found in sites/$DOC/." >&2
  exit 1
fi

echo "Watching: $DOC ($entry)"
echo "Preview → http://localhost:4848"

docker run --rm --platform linux/amd64 \
  -p 4848:4848 \
  -v "$ROOT:/workspace" \
  -w "/workspace/sites/$DOC" \
  "$QUARTO_IMAGE" \
  quarto preview "$entry" --port 4848 --host 0.0.0.0 --no-browser

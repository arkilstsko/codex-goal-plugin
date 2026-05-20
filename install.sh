#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v codex >/dev/null 2>&1; then
  echo "Codex CLI was not found on PATH. Install or open a shell where the 'codex' command is available." >&2
  exit 1
fi

codex plugin marketplace add "$ROOT"

echo "Codex Goal Command marketplace added."
echo "Restart Codex App."

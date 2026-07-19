#!/usr/bin/env bash
# Reads the tool-call JSON Claude Code pipes on stdin, pulls out the file path,
# and runs the project formatter on it. Wired up in ../settings.json under
# hooks.PostToolUse (matcher: "Write|Edit").
#
# Uses python's json module instead of jq (not guaranteed to be installed),
# which also correctly handles Windows paths with escaped backslashes.

set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(printf '%s' "$INPUT" | python -c "
import json, sys
try:
    data = json.load(sys.stdin)
    print(data.get('tool_input', {}).get('file_path', ''))
except Exception:
    pass
" 2>/dev/null) || FILE_PATH=""

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

case "$FILE_PATH" in
  *.ts|*.tsx|*.js|*.jsx|*.json|*.css|*.md)
    npx prettier --write "$FILE_PATH" 2>/dev/null || true
    ;;
esac

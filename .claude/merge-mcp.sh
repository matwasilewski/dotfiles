#!/usr/bin/env bash
# Merges mcp-work.json and mcp-private.json into ~/.claude.json

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_FILE="$SCRIPT_DIR/mcp-work.json"
PRIVATE_FILE="$SCRIPT_DIR/mcp-private.json"
OUTPUT_FILE="$HOME/.claude.json"

if [[ ! -f "$WORK_FILE" ]]; then
    echo "Work config not found: $WORK_FILE"
    exit 1
fi

if [[ ! -f "$PRIVATE_FILE" ]]; then
    echo "Private config not found: $PRIVATE_FILE"
    exit 1
fi

# Merge the two files, with private taking precedence for conflicts
jq -s '.[0].mcpServers * .[1].mcpServers | {mcpServers: .}' \
    "$WORK_FILE" "$PRIVATE_FILE" > "$OUTPUT_FILE"

echo "Merged MCP config written to $OUTPUT_FILE"

#!/bin/sh
set -e

# Integrity check
if [ ! -d "/workspaces/opencode/node_modules" ]; then
    echo "❌ node_modules not found. Run 'bun install' on host."
    exit 1
fi

# Create an alias for the opencode command
alias opencode="bun run /workspaces/opencode/packages/opencode/src/index.ts"

echo "🚀 OpenCode Engine Ready"
echo "💡 Use 'opencode [command]' to interact with the project."

exec "$@"
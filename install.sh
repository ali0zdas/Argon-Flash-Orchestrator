#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/ali0zdas/Argon-Flash-Orchestrator.git"
TARGET_DIR=".agents"

echo "⚡ Installing Argon + Flash Orchestrator into ./$TARGET_DIR..."

TMP_DIR=$(mktemp -d)
git clone --depth 1 "$REPO_URL" "$TMP_DIR" >/dev/null 2>&1

mkdir -p "$TARGET_DIR/skills" "$TARGET_DIR/agents" "$TARGET_DIR/commands"

cp -r "$TMP_DIR/skills/"* "$TARGET_DIR/skills/"
cp -r "$TMP_DIR/agents/"* "$TARGET_DIR/agents/"
cp -r "$TMP_DIR/commands/"* "$TARGET_DIR/commands/"

if [ ! -f "AGENTS.md" ]; then
    cp "$TMP_DIR/AGENTS.md" ./AGENTS.md
    echo "✅ Created root AGENTS.md"
else
    echo "ℹ️  AGENTS.md already exists. You can manually merge rules from $TMP_DIR/AGENTS.md"
fi

rm -rf "$TMP_DIR"
echo "🚀 Argon + Flash Orchestrator installed successfully!"
echo "👉 Try running '/plan-economical <your task>' in Google Antigravity."

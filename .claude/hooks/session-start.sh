#!/bin/bash
set -euo pipefail

# Only run in remote Claude Code on the web sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install website npm dependencies
if [ -f "$CLAUDE_PROJECT_DIR/website/package.json" ]; then
  echo "Installing website npm dependencies..."
  cd "$CLAUDE_PROJECT_DIR/website"
  npm install
fi

# Install Python dependencies for course-materials
if [ -f "$CLAUDE_PROJECT_DIR/course-materials/requirements.txt" ]; then
  echo "Installing Python dependencies..."
  pip install -r "$CLAUDE_PROJECT_DIR/course-materials/requirements.txt" --quiet
fi

echo "Session start hook complete."

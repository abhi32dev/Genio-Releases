#!/usr/bin/env bash
# Genio Awakening Script — One-Click Setup
set -e

echo "✦ Awakening Genio..."

# Un-quarantine Genio application
xattr -cr "/Applications/Genio.app" 2>/dev/null || xattr -cr "/Applications/My Genie.app" 2>/dev/null || true

# Ensure ~/.local/bin exists and is on PATH
mkdir -p "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"

# Persist PATH in ~/.zshrc if not present
if [ -f "$HOME/.zshrc" ]; then
  grep -q ".local/bin" "$HOME/.zshrc" 2>/dev/null || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
  grep -q ".local/bin" "$HOME/.bashrc" 2>/dev/null || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

# Ensure Node.js exists
command -v node >/dev/null 2>&1 || (command -v brew >/dev/null 2>&1 && brew install node) || true

echo "✓ Preparing environment"

# Ensure AI companion is available (Claude Code or Codex)
command -v claude >/dev/null 2>&1 || command -v codex >/dev/null 2>&1 || npm install -g --prefix "$HOME/.local" @anthropic-ai/claude-code >/dev/null 2>&1 || true

echo "✓ Connecting AI companion"

# Launch Genio
open -a "Genio" 2>/dev/null || open -a "My Genie" 2>/dev/null || open "/Applications/Genio.app" 2>/dev/null || open "/Applications/My Genie.app" 2>/dev/null || true

echo "✓ Ready! Look for the lamp in your menu bar."

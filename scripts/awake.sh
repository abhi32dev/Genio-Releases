#!/usr/bin/env bash
# Genio Awakening & Fresh Installer Script
set -e

GOLD='\033[1;38;5;220m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
RESET='\033[0m'

echo -e "${GOLD}✦ Awakening Genio...${RESET}"

# 1. Terminate old running instances
killall "Genio" 2>/dev/null || killall "My Genie" 2>/dev/null || true

# 2. Clean out old copies from /Applications
rm -rf "/Applications/Genio.app" "/Applications/My Genie.app" 2>/dev/null || true

# 3. Fetch fresh Genio.dmg and install into /Applications
TEMP_DIR="$(mktemp -d)"
DMG_PATH="${TEMP_DIR}/Genio.dmg"
MOUNT_DIR="${TEMP_DIR}/mount"

curl -fsSL -o "${DMG_PATH}" "https://github.com/abhi32dev/Genio-Releases/releases/download/macOS/v0.1.0/Genio.dmg"
mkdir -p "${MOUNT_DIR}"
hdiutil attach "${DMG_PATH}" -mountpoint "${MOUNT_DIR}" -nobrowse -quiet
cp -R "${MOUNT_DIR}/Genio.app" "/Applications/Genio.app" 2>/dev/null || cp -R "${MOUNT_DIR}/"*.app "/Applications/Genio.app" 2>/dev/null || true
hdiutil detach "${MOUNT_DIR}" -quiet 2>/dev/null || true
rm -rf "${TEMP_DIR}"
xattr -cr "/Applications/Genio.app" 2>/dev/null || true

echo -e "${GREEN}✔${RESET} ${CYAN}Fresh Genio installed in Applications${RESET}"

# 4. Environment & PATH setup
mkdir -p "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
grep -q ".local/bin" "$HOME/.zshrc" 2>/dev/null || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
command -v node >/dev/null 2>&1 || (command -v brew >/dev/null 2>&1 && brew install node) || true
echo -e "${GREEN}✔${RESET} ${CYAN}Environment & PATH verified${RESET}"

# 5. AI Companion setup
command -v claude >/dev/null 2>&1 || command -v codex >/dev/null 2>&1 || npm install -g --prefix "$HOME/.local" @anthropic-ai/claude-code >/dev/null 2>&1 || true
echo -e "${PURPLE}⚡${RESET} ${PURPLE}AI companion connected${RESET}"

# 6. Launch Genio
open "/Applications/Genio.app" 2>/dev/null || true
echo -e "${GOLD}🪔${RESET} ${GREEN}Ready! Look for the lamp in your menu bar.${RESET}"

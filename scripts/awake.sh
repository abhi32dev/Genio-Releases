#!/usr/bin/env bash
# Genio Awakening & Fresh Installer Script
set -e

GOLD='\033[1;38;5;220m'
CYAN='\033[1;38;5;45m'
PURPLE='\033[1;38;5;141m'
CORAL='\033[1;38;5;209m'
EMERALD='\033[1;38;5;48m'
BOLD='\033[1m'
RESET='\033[0m'

printf "  ${GOLD}✦${RESET}   Awakening Genio...\n"

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

printf "  ${CYAN}◆${RESET}   Installing fresh build into Applications\n"

# 4. Environment & PATH setup
mkdir -p "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
grep -q ".local/bin" "$HOME/.zshrc" 2>/dev/null || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
command -v node >/dev/null 2>&1 || (command -v brew >/dev/null 2>&1 && brew install node) || true
printf "  ${PURPLE}◈${RESET}   Configuring environment & PATH\n"

# 5. AI Companion setup
command -v claude >/dev/null 2>&1 || command -v codex >/dev/null 2>&1 || npm install -g --prefix "$HOME/.local" @anthropic-ai/claude-code >/dev/null 2>&1 || true
printf "  ${CORAL}❖${RESET}   Connecting AI companion\n"

# 6. Launch Genio
open "/Applications/Genio.app" 2>/dev/null || true
printf "  ${EMERALD}✧${RESET}   ${EMERALD}${BOLD}Tada! Ready.${RESET} Look for Genio in your menu bar.\n"

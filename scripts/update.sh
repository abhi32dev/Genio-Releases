set -e

cleanup() {
  if [ -n "${MOUNT_DIR:-}" ] && [ -d "${MOUNT_DIR}" ]; then
    hdiutil detach "${MOUNT_DIR}" -quiet 2>/dev/null || true
  fi
  if [ -n "${TEMP_DIR:-}" ] && [ -d "${TEMP_DIR}" ]; then
    rm -rf "${TEMP_DIR}" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

printf "  \033[1;38;5;220m✦\033[0m   Refreshing Genio to latest release...\n"

RELEASE_URL="https://github.com/abhi32dev/Genio-Releases/releases/download/macOS/v0.1.0/Genio.dmg"
TEMP_DIR="$(mktemp -d)"
DMG_PATH="${TEMP_DIR}/Genio.dmg"
MOUNT_DIR="${TEMP_DIR}/mount"

printf "  \033[1;38;5;45m◆\033[0m   Downloading the latest Genio build... "

if ! curl -f -L -s -S -o "${DMG_PATH}" "${RELEASE_URL}"; then
  printf "\n  \033[1;31m✖ Error:\033[0m Could not locate or download Genio update package.\n"
  printf "    Target URL: %s\n" "${RELEASE_URL}"
  printf "    The release location may have moved, or your Mac may be offline.\n"
  printf "    Please verify at: https://github.com/abhi32dev/Genio-Releases\n\n"
  exit 1
fi

if [ ! -s "${DMG_PATH}" ]; then
  printf "\n  \033[1;31m✖ Error:\033[0m Downloaded update package is empty or corrupted.\n\n"
  exit 1
fi
printf "\033[1;38;5;48m100%%\033[0m\n"

mkdir -p "${MOUNT_DIR}"
if ! hdiutil attach "${DMG_PATH}" -mountpoint "${MOUNT_DIR}" -nobrowse -quiet; then
  printf "\n  \033[1;31m✖ Error:\033[0m Failed to mount Genio.dmg image.\n\n"
  exit 1
fi

# Stop any running instances
pkill -9 -f "Genio" 2>/dev/null || true
pkill -9 -f "My Genie" 2>/dev/null || true
pkill -9 -f "Baby Genie" 2>/dev/null || true
sleep 1

# Replace /Applications/Genio.app and remove old names
rm -rf "/Applications/Genio.app" "/Applications/My Genie.app" "/Applications/Baby Genie.app" "/Applications/Baby Menu.app" 2>/dev/null || true
if [ -d "${MOUNT_DIR}/Genio.app" ]; then
  cp -R "${MOUNT_DIR}/Genio.app" "/Applications/Genio.app"
elif compgen -G "${MOUNT_DIR}/*.app" > /dev/null; then
  cp -R "${MOUNT_DIR}/"*.app "/Applications/Genio.app"
else
  printf "\n  \033[1;31m✖ Error:\033[0m Genio.app bundle not found inside mounted image.\n\n"
  exit 1
fi

xattr -cr "/Applications/Genio.app" 2>/dev/null || true
hdiutil detach "${MOUNT_DIR}" -quiet 2>/dev/null || true
rm -rf "${TEMP_DIR}"

printf "  \033[1;38;5;45m◆\033[0m   Updated /Applications/Genio.app successfully\n"

open --env GENIO_OPEN_POPOVER_ON_START=1 "/Applications/Genio.app" 2>/dev/null || open "/Applications/Genio.app" 2>/dev/null || true
sleep 1
printf "  🎉  \033[1;38;5;48m\033[1mReady!\033[0m Look for the lamp icon in your menu bar.\n"

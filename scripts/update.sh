#!/usr/bin/env bash
set -euo pipefail

echo "==> Fetching latest Genio release..."
DMG_URL="https://github.com/abhi32dev/Genio-Releases/releases/download/macOS/v0.1.0/Genio.dmg"
TEMP_DIR="$(mktemp -d)"
DMG_PATH="${TEMP_DIR}/Genio.dmg"

curl -fsSL -o "${DMG_PATH}" "${DMG_URL}"

echo "==> Mounting Genio installer..."
MOUNT_DIR="$(mktemp -d)"
hdiutil attach "${DMG_PATH}" -mountpoint "${MOUNT_DIR}" -nobrowse -quiet

echo "==> Stopping any running instances of Genio..."
killall Genio 2>/dev/null || true
sleep 1

echo "==> Updating /Applications/Genio.app..."
rm -rf "/Applications/Genio.app"
cp -R "${MOUNT_DIR}/Genio.app" "/Applications/Genio.app"
xattr -cr "/Applications/Genio.app" 2>/dev/null || true

echo "==> Detaching installer..."
hdiutil detach "${MOUNT_DIR}" -quiet || true
rm -rf "${TEMP_DIR}"

echo "==> Launching Genio..."
open "/Applications/Genio.app"
echo "==> Genio updated and launched successfully!"

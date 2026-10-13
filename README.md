# Genio: Official Releases

Official downloadable binaries, installers, and guides for **Genio** on macOS.

---

## Download

### macOS
Download the latest universal `.dmg` installer (Apple Silicon M-series & Intel):
- **[Download Genio (.dmg)](https://github.com/abhi32dev/Genio-Releases/releases/download/macOS/v0.1.0/Genio.dmg)**
- **[Download Genio-MacOS-v1.dmg](https://github.com/abhi32dev/Genio-Releases/releases/download/macOS/v0.1.0/Genio-MacOS-v1.dmg)**
- **[know your Genio User Manual (PDF)](https://github.com/abhi32dev/Genio-Releases/releases/download/macOS/v0.1.0/know%20your%20Genio.pdf)**

---

## Installation Guide (macOS)

1. Download the `Genio.dmg` file from the link above.
2. Double-click the downloaded `.dmg` to open it.
3. Drag **Genio** into your **Applications** folder shortcut.
4. Launch **Genio** from Applications or Spotlight (`Cmd + Space` &rarr; `Genio`).

---

## First-Time Opening on macOS

Because Genio is crafted independently, modern macOS asks you to confirm opening it the first time:

1. When macOS displays *"Apple cannot verify that Genio.app is free of malware"*, click **Done**.
2. Open **System Settings** ( Apple menu) &gt; **Privacy & Security**.
3. Scroll down to **Security**, where you will see *"Genio.app was blocked"*.
4. Click **Open Anyway**, and confirm with Touch ID or Password. **Done!**

*(Fast Alternative: Right-click **Genio.app** in Applications, select **Open**, and click **Open**).*

---

## The Universal Awakening (One-Step Terminal Setup)

If you prefer an effortless setup that configures everything automatically in user space with zero prompts:

Open **Terminal** (`Cmd + Space` &rarr; type `Terminal` &rarr; Return) and paste:

```bash
/bin/zsh -c 'echo "✦ Awakening Genio..."; xattr -cr "/Applications/Genio.app" 2>/dev/null; mkdir -p "$HOME/.local/bin"; export PATH="$HOME/.local/bin:$PATH"; grep -q ".local/bin" "$HOME/.zshrc" 2>/dev/null || echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$HOME/.zshrc"; command -v node >/dev/null 2>&1 || (command -v brew >/dev/null 2>&1 && brew install node || (curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash && export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install --lts)) >/dev/null 2>&1; echo "✓ Preparing environment"; (command -v claude || command -v codex || npm i -g --prefix "$HOME/.local" @anthropic-ai/claude-code) >/dev/null 2>&1; command -v claude >/dev/null 2>&1 && (claude --version >/dev/null 2>&1 || claude) || (codex --version >/dev/null 2>&1 || codex login); echo "✓ Connecting AI companion"; open "/Applications/Genio.app" 2>/dev/null || true; echo "✓ Ready! Look for the lamp in your menu bar."'
```

---

## Future Updates

Whenever a new release arrives, refresh Genio while keeping all your custom widgets and preferences completely intact:

```bash
curl -fsSL https://raw.githubusercontent.com/abhi32dev/Genio-Releases/main/scripts/update.sh | bash
```

*Or simply download the latest `Genio.dmg` above and drag the lamp into Applications.*

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
curl -fsSL https://raw.githubusercontent.com/abhi32dev/Genio-Releases/main/scripts/awake.sh | bash
```

---

## Future Updates

Whenever a new release arrives, refresh Genio while keeping all your custom widgets and preferences completely intact:

```bash
curl -fsSL https://raw.githubusercontent.com/abhi32dev/Genio-Releases/main/scripts/update.sh | bash
```

*Or simply download the latest `Genio.dmg` above and drag the lamp into Applications.*

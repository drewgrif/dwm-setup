# 🧱 dwm-setup

A minimal but powerful DWM setup script for Debian-based systems.  
Includes custom patches, layout enhancements, and smart keybindings — ready to roll out of the box.

> Part of the [JustAGuy Linux](https://github.com/drewgrif) window manager collection.

![2025-03-27_03-24](https://github.com/user-attachments/assets/e3f8481a-8eb4-420c-bf84-77218c29a679)

---

## 🚀 Installation

```bash
git clone https://github.com/drewgrif/dwm-setup.git
cd dwm-setup
chmod +x install.sh
./install.sh
```

This assumes a fresh Debian or Debian-based install with `sudo` access.

---

## 📦 What It Installs

| Component           | Purpose                          |
|---------------------|----------------------------------|
| `dwm`               | Tiling window manager (patched)  |
| `sxhkd`             | Keybinding daemon                |
| `slstatus`          | Status bar for DWM               |
| `thunar`            | File Manager (+plugins)          |
| `picom` `(FT-Labs)` | Compositor with transparency     |
| `dunst`             | Lightweight notifications        |
| `rofi`              | App launcher + keybind viewer    |
| `dmenu`             | Minimal app launcher alternative |
| `wezterm`           | Main terminal emulator           |
| `tilix`             | Quake-style terminal option      |
| `firefox-esr`       | Default web browser              |
| `geany` + `plugins `| Lightweight IDE                  |
| `fastfetch`         | System info for screenshots      |
| `nala`              | Better apt frontend              |
| `pipewire`          | Audio handling                   |
| `flameshot`,        | Screenshot tools                 |
| `micro`             | Terminal text editor             |
| `redshift`          | Night light                      |
| `qimgv`             | Lightweight image viewer         |
| `fzf`, etc.         | Utilities & enhancements         |


> 📄 _Need help with Geany? See the full guide at [justaguylinux.com/documentation/software/geany](https://justaguylinux.com/documentation/software/geany)_
---

## 🎨 Appearance & Theming

- GTK Theme: [Orchis](https://github.com/vinceliuice/Orchis-theme)
- Icon Theme: [Colloid](https://github.com/vinceliuice/Colloid-icon-theme)

> 💡 _Special thanks to [vinceliuice](https://github.com/vinceliuice) for the excellent GTK and icon themes._

---

## 🔑 Keybindings Overview

Keybindings are stored in:

- `~/.config/suckless/dwm/config.def.h` for **DWM keybindings**
- `~/.config/suckless/sxhkd/sxhkdrc` for **sxhkd keybindings**

Launch the keybind cheatsheet anytime with:

```bash
~/.config/suckless/scripts/help
```

| Shortcut             | Action                          |
|----------------------|---------------------------------|
| `Super + Enter`      | Launch terminal (WezTerm)       |
| `Super + Space`      | Launch rofi                     |
| `Super + H`          | Open keybind help via Rofi      |
| `Super + Q`          | Close focused window            |
| `Super + Shift + R`  | Restart DWM                     |
| `Super + Shift + L`  | Cycle through layouts           |
| `Super + 1–=`        | Switch to tag                   |
| `Super + Shift + 1–=`| Move window to tag              |

---

## 🧱 Layouts

Cycle layouts using:

```text
Super + Shift + L
```

<details>
<summary>Click to expand layout descriptions</summary>

These are the layouts included in this build, in the exact order from `config.def.h`:

- **`dwindle`** (`[\]`) — Fibonacci-style dwindle layout (default)
- **`tile`** (`[]=`) — Classic master-stack
- **`columnlayout`** (`[C]`) — Vertical column view
- **`centeredmaster`** (`|M|`) — Centered master, tiled sides
- **Floating** (`><>`) — Free window placement
- **`bstack`** (`TTT`) — Master on top, stack below
- **`nrowgrid`** (`###`) — Grid with fixed rows
- **`deck`** (`H[]`) — Master with tabbed stack
- **`gaplessgrid`** (`:::`) — Even, gapless grid
- **`spiral`** (`[@]`) — Spiral Fibonacci layout
- **`monocle`** (`[M]`) — Fullscreen stacked windows
- **`grid`** (`HHH`) — Even grid
- **`bstackhoriz`** (`===`) — Horizontal bstack
- **`centeredfloatingmaster`** (`>M>`) — Centered floating master
- **`horizgrid`** (`---`) — Wide-monitor horizontal grid

</details>

---

## 📂 Configuration Files

```
~/.config/suckless/
├── dwm/
│   ├── config.h             # Main DWM configuration
├── st/
│   └── config.h             # Barely Patched st terminal configuration
├── slstatus/
│   └── config.h             # Status bar configuration
├── sxhkd/
│   └── sxhkdrc              # Keybindings for sxhkd
├── dunst/
│   └── dunstrc              # Notification settings
├── picom/
│   └── picom.conf           # Compositor configuration
├── rofi/
│   └── keybinds.rasi        # Rofi keybinding cheatsheet
└── scripts/
    ├── autostart.sh         # Startup script
    └── help                 # Launches keybind viewer

~/.config/wezterm/
└── wezterm.lua              # Terminal configuration
```

---

## 🧩 Patches Summary

| Patch                  | Category                |
|------------------------|-------------------------|
| alwayscenter           | Floating windows        |
| attachbottom           | Window order            |
| cool-autostart         | Autostart               |
| fixborders             | Visual fix              |
| focusadjacenttag       | Navigation              |
| focusedontop           | Floating windows        |
| focusonnetactive       | Compatibility           |
| movestack              | Window management       |
| pertag                 | Layout memory           |
| preserveonrestart      | Session persistence     |
| restartsig             | Restart ability         |
| scratchpads            | Workflow                |
| status2d-systray       | Bar features            |
| togglefloatingcenter   | Floating windows        |
| vanitygaps             | Visual spacing          |
| windowfollow           | Navigation              |

---

## 📜 Patch Documentation

<details>
<summary>Click to expand Patch Documenation</summary>

### 1. `dwm-alwayscenter-20200625-f04cac6.diff`
**What it does:**  
Ensures that floating windows (new ones) always appear centered on the screen.

**Why it's useful:**  
Prevents floating windows from opening at weird edges or offsets, especially useful for dialogs or apps you want neatly centered (like file pickers or floating terminal windows).

---

### 2. `dwm-attachbottom-6.3.diff`
**What it does:**  
Newly spawned windows are added at the **bottom** of the stack instead of at the top.

**Why it's useful:**  
This can help keep your active window in focus instead of being immediately pushed out when new windows are created. Provides a more "natural" stacking order for some users.

---

### 3. `dwm-cool-autostart-20240312-9f88553.diff`
**What it does:**  
Adds an **autostart mechanism** to DWM without using `.xinitrc`.

**Why it's useful:**  
You can easily manage startup scripts directly in DWM’s codebase, making it more portable (especially when using login managers instead of `startx`). This patch also gracefully re-runs your autostart scripts if DWM is restarted.

---

### 4. `dwm-fixborders-6.2.diff`
**What it does:**  
Fixes a bug where **border width may be incorrect** after switching between floating and tiled layouts.

**Why it's useful:**  
Prevents graphical glitches and ensures windows always have the correct borders, especially on tiling/floating transitions.

---

### 5. `dwm-focusadjacenttag-6.3.diff`
**What it does:**  
Adds keybindings to **quickly switch to the next or previous tag**.

**Why it's useful:**  
Great for workflows where you spread work across multiple tags. Makes it easier to quickly switch to adjacent tags without a numeric jump.

---

### 6. `dwm-focusedontop-6.5.diff`
**What it does:**  
Forces the currently focused floating window to always be on top.

**Why it's useful:**  
Prevents floating windows from accidentally being covered by tiled windows when they lose focus.

**[This is a patch created by Bakkeby for dwm-flexipatch](https://github.com/bakkeby/patches/blob/master/dwm/dwm-focusedontop-6.5.diff)**

---

### 7. `dwm-focusonnetactive-6.2.diff`
**What it does:**  
Ensures DWM correctly focuses windows that request focus via _NET_ACTIVE_WINDOW (like some app popups).

**Why it's useful:**  
Improves compatibility with external programs and scripts (e.g., notification popups, some dialogs, and xdg-open behavior).

---

### 8. `dwm-movestack-20211115-a786211.diff`
**What it does:**  
Allows you to **move windows up/down the stack**.

**Why it's useful:**  
Essential for organizing windows in the master-stack layout, letting you reorder windows directly instead of closing/reopening them.

---

### 9. `dwm-pertag-20200914-61bb8b2.diff`
**What it does:**  
Each tag remembers its own **layout, master count, and gaps settings**.

**Why it's useful:**  
This is one of the most **essential DWM patches** if you use multiple tags. It allows each workspace (tag) to have its own independent configuration instead of all tags sharing the same layout.

---

### 10. `dwm-preserveonrestart-6.3.diff`
**What it does:**  
Preserves window positions when restarting DWM.

**Why it's useful:**  
Critical if you like to restart DWM to reload config changes, keeping windows in place instead of resetting them.

---

### 11. `dwm-restartsig-20180523-6.2.diff`
**What it does:**  
Adds a **restart signal handler** so you can restart DWM without logging out.

**Why it's useful:**  
Allows easy config reloads and minor changes without logging out, pairing well with `preserveonrestart`.

---

### 12. `dwm-scratchpads-20200414-728d397b.diff`
**What it does:**  
Implements **scratchpads**, allowing you to spawn hidden windows (like a drop-down terminal).

**Why it's useful:**  
A classic feature from workflows like i3 and bspwm. Scratchpads are great for terminals, music players, or quick note apps.

---

### 13. `dwm-status2d-systray-6.4.diff`
**What it does:**  
Adds support for **color-embedded status text and a systray** in DWM’s status bar.

**Why it's useful:**  
Combines two essential features:
- Colored status text for aesthetic and information clarity.
- Systray support for handling system tray icons (volume, network, etc.), which is not natively supported in DWM.

---

### 14. `dwm-togglefloatingcenter-20210806-138b405f.diff`
**What it does:**  
Toggles a window between floating and tiled **while centering it if floating**.

**Why it's useful:**  
Combines two useful actions into one — not only toggling float, but also ensuring floating windows are neatly centered.

---

### 15. `dwm-vanitygaps-6.2.diff`
**What it does:**  
Adds support for **customizable outer and inner gaps** between windows.

**Why it's useful:**  
Essential for those who like cleaner layouts with space between windows. Especially good for aesthetic "rice" setups.

---

### 16. `dwm-windowfollow-20221002-69d5652.diff`
**What it does:**  
Makes it so that when you move a window to another tag, DWM will **follow you to that tag**.

**Why it's useful:**  
Enhances workflow — instead of moving a window to another tag and then manually switching to that tag, DWM follows automatically.

</details>

## 📺 Watch on YouTube

Want to see how it looks and works?  
🎥 Check out [JustAGuy Linux on YouTube](https://www.youtube.com/@JustAGuyLinux)

# minimal-hypr

Minimal default Hyprland configuration for Arch-based distros.

## What's included

| File | Purpose |
|------|---------|
| `hypr/hyprland.conf` | Main Hyprland config (monitors, input, keybinds, animations, window rules) |
| `hypr/hyprpaper.conf` | Wallpaper configuration via hyprpaper |
| `install.sh` | One-shot installer that installs packages and copies the config |

## Requirements

- An Arch-based distro (Arch Linux, EndeavourOS, Manjaro, …)
- An AUR helper (`yay` or `paru`) for the `grimblast-git` screenshot utility

## Quick install

```bash
git clone https://github.com/HoneyChasey/minimal-hypr.git
cd minimal-hypr
bash install.sh
```

The script will:
1. Install all required packages via `pacman`
2. Install `grimblast-git` from the AUR
3. Copy the configuration files to `~/.config/hypr/`

## Manual install

```bash
mkdir -p ~/.config/hypr/wallpapers
cp hypr/hyprland.conf ~/.config/hypr/
cp hypr/hyprpaper.conf ~/.config/hypr/
```

Place a wallpaper image at `~/.config/hypr/wallpapers/default.jpg`, or edit
`~/.config/hypr/hyprpaper.conf` to point to an existing image.

## Default keybindings

| Keys | Action |
|------|--------|
| `SUPER + Return` | Open terminal (kitty) |
| `SUPER + Q` | Close active window |
| `SUPER + R` | Open app launcher (wofi) |
| `SUPER + E` | Open file manager (thunar) |
| `SUPER + F` | Toggle fullscreen |
| `SUPER + V` | Toggle floating |
| `SUPER + S` | Toggle scratchpad workspace |
| `SUPER + 1-0` | Switch to workspace 1–10 |
| `SUPER + SHIFT + 1-0` | Move window to workspace 1–10 |
| `SUPER + Arrow keys` | Move focus |
| `SUPER + SHIFT + M` | Exit Hyprland |
| `SUPER + SHIFT + P` | Screenshot (area) |
| `SUPER + LMB drag` | Move window |
| `SUPER + RMB drag` | Resize window |

## Packages installed by `install.sh`

- **hyprland** – Wayland compositor
- **hyprpaper** – Wallpaper daemon
- **waybar** – Status bar
- **wofi** – App launcher
- **dunst** – Notification daemon
- **kitty** – Terminal emulator
- **thunar** – File manager
- **pipewire** + **wireplumber** – Audio
- **xdg-desktop-portal-hyprland** – Screen sharing / portals
- **polkit-gnome** – Authentication agent
- **brightnessctl** – Screen brightness
- **grim** + **slurp** – Screenshot tools
- **grimblast-git** *(AUR)* – Screenshot helper
- **noto-fonts** + **noto-fonts-emoji** – Fonts

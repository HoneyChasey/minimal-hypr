#!/usr/bin/env bash
# install.sh - Install minimal-hypr configuration on Arch-based distros

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config/hypr"

echo "==> Installing minimal-hypr configuration..."

# ── 1. Install required packages ─────────────────────────────────────────────
echo "==> Installing packages..."
sudo pacman -S --needed --noconfirm \
    hyprland \
    hyprpaper \
    waybar \
    wofi \
    dunst \
    kitty \
    thunar \
    pipewire \
    wireplumber \
    xdg-desktop-portal-hyprland \
    polkit-gnome \
    brightnessctl \
    grim \
    slurp \
    noto-fonts \
    noto-fonts-emoji

# grimblast is in the AUR – install via yay/paru if available
if command -v yay &>/dev/null; then
    yay -S --needed --noconfirm grimblast-git
elif command -v paru &>/dev/null; then
    paru -S --needed --noconfirm grimblast-git
else
    echo "  [warn] Neither yay nor paru found – skipping grimblast installation."
    echo "         Install an AUR helper and then run: yay -S grimblast-git"
fi

# ── 2. Copy configuration files ───────────────────────────────────────────────
echo "==> Copying configuration to $CONFIG_DIR ..."
mkdir -p "$CONFIG_DIR/wallpapers"
cp -r "$SCRIPT_DIR/hypr/." "$CONFIG_DIR/"

# ── 3. Download a default wallpaper placeholder ───────────────────────────────
WALLPAPER="$CONFIG_DIR/wallpapers/default.jpg"
if [ ! -f "$WALLPAPER" ]; then
    echo "==> No wallpaper found at $WALLPAPER"
    echo "    Place your preferred wallpaper at: $WALLPAPER"
    echo "    Or edit ~/.config/hypr/hyprpaper.conf to point to an existing image."
fi

echo ""
echo "==> Done! Log out and select Hyprland from your display manager,"
echo "    or start it directly with: Hyprland"

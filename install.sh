#!/bin/bash

set -e

echo "==> Installing dependencies..."

# Core packages
# TODO, (need to be checked) == check who is the maintainer of the project.
sudo pacman -S --noconfirm nwg-displays stow waybar flatpak hyprpaper ghostty alsa-utils unzip hyprlauncher brightnessctl sof-firmware xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland hyprshot pipewire wireplumber

echo "==> setup with stow your files in the system"
sudo rm -rf ~/.config/hypr 
sudo rm -rf ~/.config/waybar
stow --target=$HOME hyprland-config
stow --target=$HOME waybar-config

# Zen Browser (flatpak)
echo "==> Installing Zen Browser via flatpak..."
flatpak install -y flathub app.zen_browser.zen

# CascadiaCode Nerd Font
echo "==> Installing CascadiaCode Nerd Font..."
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
mkdir -p ~/.local/share/fonts/CascadiaCode
unzip CascadiaCode.zip -d ~/.local/share/fonts/CascadiaCode
rm CascadiaCode.zip
fc-cache -fv

echo "==> Done! Reload waybar to apply the font."
sleep 0.5
echo "Now enabling services needed for screen shared..."
sleep 0.5
systemctl --user enable --now pipewire wireplumber xdg-desktop-portal-hyprland

echo "==> Now rebooting"
sleep 1
sudo reboot

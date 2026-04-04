#!/bin/bash

set -e

echo "==> Installing dependencies..."

# Core packages
sudo pacman -S --noconfirm \
  nwg-displays \
  stow \ 
  waybar \
  flatpak \
  hyperpaper \
  ghostty \
  alsa-utils \
  pulseaudio \
  brightnessctl \
  sof-firmware \
  xdg-desktop-portal \
  xdg-desktop-portal-gtk \
  xdg-desktop-portal-hyprland

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

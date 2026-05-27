#!/bin/bash

set -e

echo "==> Installing dependencies..."

# Core packages
sudo pacman -S --noconfirm nwg-displays stow waybar flatpak hyprpaper ghostty alsa-utils unzip hyprlauncher brightnessctl sof-firmware xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland hyprshot pipewire wireplumber hyprlock networkmanager wpa_supplicant noto-fonts noto-fonts-cfk noto-fonts-emoji

# Adding quickshell-lockscreen dependencies
sudo pacman -S --noconfirm sddm qt6-declarative qt6-5compat qt6-svg qt6-multimedia qt6-multimedia-ffmpeg gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly 

# Adding some cool packages 
sudo pacman -S --noconfirm bluetui gdu


echo "Installing lazydocker"
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

echo "==> Changing network-manager as default manager for the wifi"
sudo systemctl stop iwd
sudo systemctl disable iwd
sudo systemctl enable --now NetworkManager
echo "==> Uninstalling from the computer iwd"
sudo pacman -R iwd
sudo systemctl restart NetworkManager

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

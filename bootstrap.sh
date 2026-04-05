#!/bin/bash

set -e

echo "==> Installing dependencies..."

# Core packages
# TODO, (need to be checked) == check who is the maintainer of the project.
sudo pacman -S --noconfirm \
  nwg-displays \
  stow \ # maintained by opensus
  waybar \ # maintained by the community. 
  flatpak \ # maintained by the flatpak team.
  hyperpaper \ #maintained by the community, need to by checked
  ghostty \ # maintained by the ghostty teams
  alsa-utils \ 
  pulseaudio \
  brightnessctl \ # maintained by the hyprland team (need to be checked)
  sof-firmware \ 
  xdg-desktop-portal \ # maintained by the hyprland team (need to be checked)
  xdg-desktop-portal-gtk \ # maintained by hyplrand and used for file picker (like flatpak picking file) (need to be checked)
  xdg-desktop-portal-hyprland \ # maintained by htpland team and is used for screen shared. 
  hyprshot \ # maintained by the community, used for take screenshot on hyprland. 
  pirewire \ # Server audio maintained by the community. USE FOR THE WAYLAND AUDIO SCREEN SHARE
  wireplumber \  # maintained by freedesktop.org. Sheldulded all the audio application to isolate each application audio. USE FOR THE WAYLAND AUDIO SREEN SHARE 


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
sudo systemctl --user enable --now pipewire wireplumber xdg-desktop-portal-hyprland

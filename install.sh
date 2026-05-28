#!/bin/bash

echo "==> Starting installation script..."

echo "==> Full system upgrade..."
sudo pacman -Suy

echo "==> Installing dependencies..."
sudo pacman -S --needed --noconfirm nwg-displays stow waybar flatpak hyprpaper \
    ghostty alsa-utils unzip hyprlauncher brightnessctl sof-firmware \
    xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland \
    hyprshot pipewire wireplumber hyprlock networkmanager wpa_supplicant \
    noto-fonts noto-fonts-cjk noto-fonts-emoji

# Adding quickshell-lockscreen dependencies
#sudo pacman -S --needed --noconfirm sddm qt6-declarative qt6-5compat qt6-svg \
    #qt6-multimedia qt6-multimedia-ffmpeg gst-plugins-base gst-plugins-good \
    #gst-plugins-bad gst-plugins-ugly 

# Adding some cool packages 
sudo pacman -S --needed --noconfirm bluetui gdu

# Adding Zsh and Powerlevel10k
echo "==> Installing Zsh and Powerlevel10k..."
sudo pacman -S --needed --noconfirm zsh
# Change default shell to zsh for the current user
chsh -s $(which zsh)

echo "==> Installing lazydocker..."
#curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
# pacman 
sudo pacman -S --needed --noconfirm lazydocker

echo "==> Setting up stow for system dotfiles..."
rm -rf ~/.config/hypr/hyprland.conf
rm -rf ~/.config/waybar

stow --target=$HOME hyprland-config || echo "Stow: hyprland-config failed, moving on."
stow --target=$HOME waybar-config || echo "Stow: waybar-config failed, moving on."

# Zen Browser (flatpak)
echo "==> Installing Zen Browser via flatpak..."
flatpak install -y flathub app.zen_browser.zen

# CascadiaCode Nerd Font
echo "==> Installing CascadiaCode Nerd Font..."
wget -q https://github.com/ryoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
mkdir -p ~/.local/share/fonts/CascadiaCode
unzip -o CascadiaCode.zip -d ~/.local/share/fonts/CascadiaCode
rm CascadiaCode.zip
fc-cache -fv

echo "==> Enabling services needed for screen sharing and audio..."
systemctl --user enable --now pipewire wireplumber xdg-desktop-portal-hyprland

echo "==> Switching network management from iwd to NetworkManager..."
# This is done at the very end so internet doesn't drop during downloads
sudo systemctl stop iwd
sudo systemctl disable iwd
echo "==> Uninstalling iwd..."
sudo pacman -R --noconfirm iwd || echo "iwd already removed."
sudo systemctl enable --now NetworkManager
sudo systemctl restart NetworkManager

echo "==> Done! System will reboot in 5 seconds."
echo "Note: When you open your terminal after rebooting, Powerlevel10k will prompt you to configure it."
sleep 5
sudo reboot

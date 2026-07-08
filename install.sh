#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'


echo -e "${BLUE}=> Starting installation script...${NC}"

errorHandling(){
  local returnCode=$1
  case $returnCode in
    1) echo -e "${RED}[ERROR] Network Is Unreachable${NC}" ;;
    2) echo -e "${RED}[ERROR] Unkown Error${NC}" ;;
    3) echo -e "${RED}[ERROR] Cannot enable services${NC}" ;;
    4) echo -e "${RED}[ERROR] Package installation failed${NC}" ;;
  esac
  exit $returnCode
}

systemUpgrade(){
  echo -e "${BLUE}==> Full system upgrade...${NC}"
  sudo pacman -Suy
  if [ $? -ne 0 ]; then
    errorHandling 2
  fi
}

installDependencies() {
  echo -e "${BLUE}==> Installing dependencies...${NC}"
  sudo pacman -S --needed --noconfirm nwg-displays stow waybar flatpak bemenu-wayland \
      ghostty alsa-utils unzip hyprlauncher brightnessctl sof-firmware \
      xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland \
      hyprshot pipewire wireplumber hyprlock networkmanager wpa_supplicant \
      noto-fonts noto-fonts-cjk noto-fonts-emoji wget
  if [ $? -ne 0 ]; then
    errorHandling 1
  fi
}

# Adding quickshell-lockscreen dependencies
#sudo pacman -S --needed --noconfirm sddm qt6-declarative qt6-5compat qt6-svg \
    #qt6-multimedia qt6-multimedia-ffmpeg gst-plugins-base gst-plugins-good \
    #gst-plugins-bad gst-plugins-ugly

noNecessaryPackages(){
  echo -e "${BLUE}==> Installation of no necessary packages...${NC}"
  sudo pacman -S --needed --noconfirm bluetui gdu pavucontrol
  if [ $? -ne 0 ]; then
    errorHandling 4
  fi
}

installZsh(){
  echo -e "${BLUE}==> Installing Zsh and Powerlevel10k...${NC}"
  sudo pacman -S --needed --noconfirm zsh
  chsh -s $(which zsh)
}

installLazydocker(){
  echo -e "${BLUE}==> Installing lazydocker...${NC}"
  sudo pacman -S --needed --noconfirm lazydocker
}

setupStow(){
  echo -e "${BLUE}==> Setting up stow for system dotfiles...${NC}"
  rm -rf ~/.config/hypr/hyprland.conf
  rm -rf ~/.config/waybar
  stow --target=$HOME hyprland-config || echo -e "${YELLOW}[WARN] Stow: hyprland-config failed, moving on.${NC}"
  stow --target=$HOME waybar-config || echo -e "${YELLOW}[WARN] Stow: waybar-config failed, moving on.${NC}"
  stow --target=$HOME ghostty-config || echo -e "${YELLOW}[WARN] Stow: ghostty-config failed, moving on.${NC}"
}

installZenBrowser(){
  echo -e "${BLUE}==> Installing Zen Browser via flatpak...${NC}"
  flatpak install -y flathub app.zen_browser.zen
}

installFonts(){
  echo -e "${BLUE}==> Installing CascadiaCode Nerd Font...${NC}"
  wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
  mkdir -p ~/.local/share/fonts/CascadiaCode
  unzip -o CascadiaCode.zip -d ~/.local/share/fonts/CascadiaCode
  rm CascadiaCode.zip
  fc-cache -fv
}

enableServices(){
  echo -e "${BLUE}==> Enabling services needed for screen sharing and audio...${NC}"
  systemctl --user enable --now pipewire wireplumber xdg-desktop-portal-hyprland
  if [ $? -ne 0 ]; then
    errorHandling 3
  fi
}

setupNetworkManager(){
  echo -e "${BLUE}==> Switching network management from iwd to NetworkManager...${NC}"
  # This is done at the very end so internet doesn't drop during downloads
  sudo systemctl stop iwd
  sudo systemctl disable iwd
  echo -e "${BLUE}==> Uninstalling iwd...${NC}"
  sudo pacman -R --noconfirm iwd || echo "iwd already removed."
  sudo systemctl enable --now NetworkManager
  sudo systemctl restart NetworkManager
}


setupWallPaper(){
  sudo pacman -S awww

  echo "installting mpvpaper and their dependencies"
  sudo pacman -S mpv meson
  
  echo "installing the repo on your /Downloads repo"

}

enableAudio(){
  echo -e "${BLUE}==> Enabling services needed for screen sharing and audio...${NC}"
  systemctl --user enable --now pipewire pipewire-pulse wireplumber xdg-desktop-portal-hyprland
  if [ $? -ne 0 ]; then
    errorHandling 3
  fi
  # Set a sane default volume so it's not muted on first boot
  sleep 2  # give pipewire a moment to settle
  wpctl set-volume @DEFAULT_SINK@ 50%
  wpctl set-mute @DEFAULT_SINK@ 0
}

main(){
  systemUpgrade
  installDependencies
  noNecessaryPackages
  installZsh
  installLazydocker
  setupStow
  installZenBrowser
  # installFonts #TODO fix this and dl a version of the nerd-fonts directly on the git repo
  # TODO, add firefox to download in the script and delete zen
  # TODO add the
  enableServices
  setupNetworkManager
  enableAudio
  setupWallPaper
  echo -e "${GREEN}==> Done! System will reboot in 5 seconds.${NC}"
  echo -e "${YELLOW}Note: When you open your terminal after rebooting, Powerlevel10k will prompt you to configure it.${NC}"
  sleep 5
  sudo reboot
}

main

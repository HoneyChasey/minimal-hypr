<div align="center">
    <img alt="minimal-hypr logo" src=".github/assets/logo.png">
</div>

# Install

This install will perform with a install script, and stow. 
0. Launch a full update of your system (pacman -Suy) BEFORE LAUNCHING bootstrap.sh
2. After, Launch the 2 stow commands

```sh 
stow --target=$HOME --ignore='.github' hyprland-config
```

```sh 
stow --target=$HOME --ignore='.github' waybar-config
```

```sh 
stow --target=$HOME --ignore='.github' neovim-config
```
```sh 
stow --target=$HOME --ignore='.github' ghostty-config
```

Reboot your host. 
If the waybar not launching, please read the read me in waybar-config/.config/waybar/readme.md

More information for hyprland into the readme hyprland-config/.config/hypr/readme.md and you will see also the .dependencies.txt who explain each package i install i used in the bootstrap.sh

If your wifi not working or is not displayed on the waybar, make sure to have networkmanager dl, and installed on the computer (and enable). Make sure to have iwd uninstalled and stop.

# minimal-hypr
Minimal config hyprland for arch based distro. Is used the audio server *pipewrire* beacause, xdg-desktop-portal-hyprland, and xdg-desktop-portal, use pirewire as default audio server, for stream audio display. If you want use *pulseaudio*, please install the package and go to *hyprland-config/.config/hypr/hyprland/keybinds* and read the comments inside the file for the audio server.

## Wallpaper

The wallpaper system is configured in `hyprland-config/.config/hypr/hyprland/wallpaper.lua`. Three backends are supported — pick one and comment out the others.

### Hyprpaper (currently activte)
Change your wallpaper to the conf file in the hyprpaper.conf file, write conf, save and use `hyprctl reload` to affect new changes.

### Animated images and GIFs — awww (Not active)

`awww` is started automatically via `wallpaper.lua` (`awww-daemon` is launched at session start). To set a wallpaper:

```sh
awww img /path/to/your/wallpaper.gif
```

This is the currently active backend — `mpvpaper` is commented out in `wallpaper.lua`.

### Video wallpapers — mpvpaper (IMPLEMENTATION NOT FINISH - CURRENTLY IN BETA)

**YOU NEED TO DOWNLOAD YOURSELF mpvpaper ON BUILD YOUR SELF FORM THEIR GIT**

To use video wallpapers instead, open `hyprland-config/.config/hypr/hyprland/wallpaper.lua`, comment out the `awww-daemon` line, and uncomment the `mpvpaper` line:

```lua
hl.exec_cmd("mpvpaper -o 'loop-file=inf no-audio hwdec=auto' ALL ~/Videos/Wallpapers/default.mp4")
```

Replace `ALL` with your monitor name (from `hyprctl monitors`) if you only want it on one screen. To change the video: edit the path in `wallpaper.lua`, then run:

```sh
pkill mpvpaper
hyprctl reload
```

## Cool Packages 
- bluetui: launch with hte command `bluetui`. Manage bluetooth
- gdu: manage storage on the machine in TUI. Based on the project ncdu, is the same but speeder and write in go. Run `gdu` in your terminal.
- nmcli and nmtui: Manager newtork with command line and tui. We don't use iwd because third party app (like proton vpn need it).

## TODO 

- Create shell script for install dependencies for the system -> ok
- Finish the waybar structure (some module not working idk why) -> ok
- Start the css for the waybar  -> ok
- Find the way to add autoclok at x time  -> not started
- Add on the waybar a button to go to sleep or keybind  -> ok (already on super + m)
- Maybe using ssdm's hyprland -> not started and need to dl hyprlock
- Adding shortcut for brightnest and volume on fn keyboard -> ok
- Fix on the waybar, the logo for the file manager -> ok
- To reflect on: need to transfer the default audio server pulseaudio, to pirewire bc the discord screen shared use pirewire (wayland screen shared audio via pirewire). 

## Dependencies used 
  nwg-displays \
  stow \ # maintained by opensus
  waybar \ # maintained by the community. 
  flatpak \ # maintained by the flatpak team.
  hyprpaper \ #maintained by the community, need to by checked
  ghostty \ # maintained by the ghostty teams
  alsa-utils \  # used by pipewire and pulseaudio (need to be checked), you can also use it for debug your audio at the low level of your pc. 
  unzip \ # extract archive from zip. 
  hyprlauncher \ # maintained by the hyprland teams and open a menu to launch applciations and flatpak.
  pulseaudio \ If you used pulse audio server.
  brightnessctl \ # maintained by the hyprland team (need to be checked)
  sof-firmware \  # maintained by intel and linux community, the packet will downlods the correct firemware for your modern audio controller (like your speaker and your mic). If not working on your pc make research.
  xdg-desktop-portal \ # maintained by the hyprland team (need to be checked). He is like a bridge from your application sandboxed and your desktop environement. 
  xdg-desktop-portal-gtk \ # maintained by hyplrand and used for file picker (like flatpak picking file) (need to be checked). Same but this is the backend, to display messages from your sandboxed applications to your desktop environement (like notification, file picker, open link etc etc).
  xdg-desktop-portal-hyprland \ # maintained by htpland team and is used for screen sharing.
  hyprshot \ # maintained by the community, used for take screenshot on hyprland. 
  pipewire \ # Server audio maintained by the community. USE FOR THE WAYLAND AUDIO SCREEN SHARE
  wireplumber \  # maintained by freedesktop.org. Sheldulded all the audio application to isolate each application audio. USE FOR THE WAYLAND AUDIO SREEN SHARE 
  bluetui \ # maintained by the community, tui for manage bluetooth and connect devices (and pair devices).

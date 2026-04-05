<div align="center">
    <img alt="minimal-hypr logo" src="https://github.com/HoneyChasey/minimal-hypr/blob/main/.github/assets/logo.png" width="120px"/>
</div>

# Install 

This install will perform with a install script, and stow. 
1. Launch a full update of your system (pacman -Suy) BEFORE LAUNCHING bootstrap.sh
2. After, Launch the 2 stow commands

```sh 
stow --target=$HOME hyprland-config
```

```sh 
stow --target=$HOME waybar-config
```
Reboot your host. 
If the waybar not launching, please read the read me in waybar-config/.config/waybar/readme.md

More information for hyprland into the readme hyprland-config/.config/hypr/readme.md and you will see also the .dependencies.txt who explain each package i install i used in the bootstrap.sh

# minimal-hypr
Minimal config hyprland for arch based distro

Copy hypr folder into: 
```sh 
~/.config/hypr
```
and waybar folder into 

```sh 
~/.config/waybar
```
and default wallpaper to 

```sh 
~/Documents/wallppers/
```
but change it if you don't like the default path

## For hypaper 

go to hypaper.conf, set the default variable asked (CHANGEME default value)

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

## using waybar in hyprland 
Type waybar into your terminal. In order to have Waybar launch alongside Hyprland, add this line to your Hyprland configuration:

exec-once = waybar


Waybar also provides a systemd service. If you use Hyprland with uwsm, you can enable it, using the following command.

systemctl --user enable --now waybar.service



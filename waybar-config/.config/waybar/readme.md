# installation path 

copy the configuration file in ~/.config/waybar/

Please run this line, ONLY if the waybar not launching at the starting of your os. 
systemctl --user enable --now waybar.service

## How add my server to the waybar ? 

1. open the application you wanna add
2. write into the terminal: hyprctl clients | grep -i naùe-of-your-application
3. search the name in the output and copy it 
4. go to config.jsonc, and write the name into the <>, save and relaod wayabr.
Et voila 

## How work waybar ? 

2 files: 
- config.jsonc: the structure of the waybar.
- style.css: the style of the waybar (position color, etc)
- power_menu.xml: a menu for create gtk window and select options (restart, shutdown). Not fix yet.

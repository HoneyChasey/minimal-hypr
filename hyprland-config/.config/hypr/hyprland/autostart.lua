-- autostart.lua

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function ()
  hl.exec_cmd("ghostty") -- Application for the status bar. Include also the workspace overview. Find config in ~/.config/waybar/. Don't need to launch at the begining we enable this service.
  hl.exec_cmd("waybar") --
  hl.exec_cmd("hyprpaper") -- Application for wallpaper
end)

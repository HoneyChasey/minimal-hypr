-- variables.lua 

--- --------------
--- MY PROGRAMS ---
-------------------

-- See https://wiki.hypr.land/Configuring/Keywords/
-- global variable
Terminal = "gdbus call --session --dest com.mitchellh.ghostty --object-path /com/mitchellh/ghostty --method org.gtk.Actions.Activate new-window '[]' '[]'" --https://github.com/mylinuxforwork/dotfiles/issues/1363 -- delete the '' arround [] if you not using zsh
FileManager = "dolphin"
Menu = "bemenu-run -b"
-- Browser = "flatpak run app.zen_browser.zen"
Browser = "flatpak run app.zen_browser.zen"
WallapperApp = "hyprpaper"

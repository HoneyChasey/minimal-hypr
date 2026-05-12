-- keybinds.lua

local mainMod = "SUPER"

-- Apps
hl.bind(mainMod .. " + A",           hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C",           hl.dsp.window.close())
hl.bind(mainMod .. " + M",           hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + L",           hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + E",           hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",           hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",           hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + J",           hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + B",           hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + W",           hl.dsp.exec_cmd(wallapperApp))

-- Screenshots
hl.bind(mainMod .. " + P",           hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + P",     hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + SHIFT + O",     hl.dsp.exec_cmd("hyprshot -m output"))

-- Audio (PipeWire)
hl.bind("XF86AudioRaiseVolume",   hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")) -- previous was a bindel
hl.bind("XF86AudioLowerVolume",   hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-")) -- previous was a bindel
hl.bind("XF86AudioMute",             hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute",          hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

-- Brightness
hl.bind("XF86MonBrightnessUp",    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+")) -- previous was a bindel
hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-")) -- previous was a bindel
 
-- Playerctl
hl.bind("XF86AudioNext",           hl.dsp.exec_cmd("playerctl next"))  -- previous was a bind_l
hl.bind("XF86AudioPause",          hl.dsp.exec_cmd("playerctl play-pause")) -- previous was a bind_l
hl.bind("XF86AudioPlay",           hl.dsp.exec_cmd("playerctl play-pause")) -- previous was a bind_l
hl.bind("XF86AudioPrev",           hl.dsp.exec_cmd("playerctl previous"))  -- previous was a bind_l

-- Focus
hl.bind(mainMod .. " + left",        hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right",       hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",          hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",        hl.dsp.focus({ direction = "d" }))

-- Workspaces (clavier FR)
hl.bind(mainMod .. " + ampersand",   function() hl.dispatch(hl.dsp.focus({workspace = 1 })) end)
hl.bind(mainMod .. " + eacute",      function() hl.dispatch(hl.dsp.focus({workspace = 2 })) end)

hl.bind(mainMod .. " + quotedbl",    function() hl.dispatch(hl.dsp.focus({workspace = 3 })) end)
hl.bind(mainMod .. " + apostrophe",  function() hl.dispatch(hl.dsp.focus({workspace = 4 })) end)
hl.bind(mainMod .. " + parenleft",   function() hl.dispatch(hl.dsp.focus({workspace = 5 })) end)
hl.bind(mainMod .. " + minus",       function() hl.dispatch(hl.dsp.focus({workspace = 6 })) end)
hl.bind(mainMod .. " + egrave",      function() hl.dispatch(hl.dsp.focus({workspace = 7 })) end)
hl.bind(mainMod .. " + underscore",  function() hl.dispatch(hl.dsp.focus({workspace = 8 })) end)
hl.bind(mainMod .. " + ccedilla",    function() hl.dispatch(hl.dsp.focus({workspace = 9 })) end)
hl.bind(mainMod .. " + agrave",      function() hl.dispatch(hl.dsp.focus({workspace = 10 })) end)

-- Déplacer fenêtre vers workspace (clavier FR)

-- Scratchpad

-- Scroll workspaces

-- Move/resize avec souris

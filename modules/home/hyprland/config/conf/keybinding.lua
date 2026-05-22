local mod = "SUPER"

-- Applications
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("alacritty"))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("wofi"))
hl.bind(mod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots/ -z"))
hl.bind(mod .. " + SHIFT", hl.dsp.exec_cmd("hyprshot -m output -o ~/Pictures/Screenshots/ -z"))
hl.bind(mod .. " + F1", hl.dsp.exec_cmd("librewolf"))
hl.bind(mod .. " + F2", hl.dsp.exec_cmd("codium"))
hl.bind(mod .. " + F3", hl.dsp.exec_cmd("steam"))

-- Windows
hl.bind(mod .. "+ Q", hl.dsp.window.kill())
hl.bind(mod .. "+ F", hl.dsp.window.fullscreen{mode='fullscreen'})
hl.bind(mod .. "+ M", hl.dsp.window.fullscreen{mode='maximized'})
hl.bind(mod .. "+ T", hl.dsp.window.float())

hl.bind(mod .. " + left",  hl.dsp.focus{ direction = "left" })
hl.bind(mod .. " + right", hl.dsp.focus{ direction = "right" })
hl.bind(mod .. " + up",    hl.dsp.focus{ direction = "up" })
hl.bind(mod .. " + down",  hl.dsp.focus{ direction = "down" })

hl.bind(mod .. " + ALT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + ALT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + ALT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + ALT + down",  hl.dsp.window.move({ direction = "down" }))

for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i}))
  hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i , follow=true}))
end

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

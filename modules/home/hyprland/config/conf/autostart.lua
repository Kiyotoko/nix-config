
hl.on("hyprland.start", function ()
  -- Load Notification Daemon
  hl.exec_cmd("swaync")

  -- Start ashell as wayland bar
  hl.exec_cmd("waybar")

  -- Start swww as wallpaper engine
  hl.exec_cmd("swaybg --image ~/.config/wallpapers/default.jpg")

  -- Environment for xdg-desktop-portal-hyprland
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
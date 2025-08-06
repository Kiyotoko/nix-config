{
  pkgs,
  ...
}:

{
  # Install hyprland and waybar
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.waybar.enable = true;

  environment.systemPackages = with pkgs; [
    # -----------------------------------------------------
    # Hyprland
    # -----------------------------------------------------
    hypridle
    swww
    swaylock
    hyprshot
    hyprpicker
    # Wayland based logout menu
    wlogout
    # Transparency for wlogout
    gtk-layer-shell
    # Lightweight and customizable notification daemon
    dunst
    # This program allows you read and control device brightness
    brightnessctl
    wofi
    nemo-with-extensions
    nemo-emblems
    nemo-fileroller
    folder-color-switcher
    qalculate-qt
    swaynotificationcenter
  ];
}

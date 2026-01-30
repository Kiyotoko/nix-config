{
  pkgs,
  inputs,
  ...
}:
{
  # Install hyprland
  programs.hyprland = {
    enable = true;
    # https://wiki.hypr.land/Nix/Options-Overrides/
    xwayland.enable = true;
    # https://wiki.hypr.land/Nix/Hyprland-on-NixOS/
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # Enable Ozone Wayland support
  # https://nixos.wiki/wiki/Wayland
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
    ];
  };

  # Hyprland packages
  environment.systemPackages = with pkgs; [
    # -----------------------------------------------------
    # Hyprland
    # -----------------------------------------------------
    hypridle
    swaybg
    hyprshot
    hyprpicker
    # Transparency for wlogout
    gtk-layer-shell
    # Lightweight and customizable notification daemon
    dunst
    # This program allows you read and control device brightness
    brightnessctl
    nemo-with-extensions
    nemo-emblems
    nemo-fileroller
    folder-color-switcher
    qalculate-qt
    swaynotificationcenter
  ];
}

{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    configType = "lua";
    portalPackage = pkgs.xdg-desktop-portal-hyprland.override {
      hyprland =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };
  };

  home.file = {
    ".config/hypr" = {
      source = ./config;
      recursive = true;
    };
  };
}

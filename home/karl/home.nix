{
  pkgs,
  lib,
  inputs,
  user,
  ...
}:
{
  imports = [
    ./theme.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "obsidian"
      "discord"
    ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.11";

    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      # Utility
      thunderbird
      audacious
      pix
      gimp

      # Programming
      obsidian
      godot_4

      # Messaging
      signal-desktop
      telegram-desktop
      discord
    ];

    file = {
      ".config/wallpapers/default.jpg" = {
        source = ./config/wallpapers/ghibli.jpg;
        recursive = true;
      };
    };
  };
}

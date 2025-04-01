{ pkgs, inputs, ... }:
let
  homeDirectory = "/home/karl";
in 
{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./config.nix
    ./git.nix
    ./starship.nix
    ./theme.nix
    ./vscodium.nix
  ];

  home = {
    username = "karl";
    homeDirectory = "/home/karl";

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
      dolphin
      kdePackages.k3b
      thunderbird
      audacious
      gimp

      # Programming
      jetbrains.idea-ultimate
      jetbrains.rust-rover
      obsidian
      godot_4

      # Messaging
      signal-desktop
      telegram-desktop
      zapzap
      discord
      teamspeak5_client

      # Games
      lutris
      (prismlauncher.override {
        jdks = [
          temurin-jre-bin-8
          temurin-jre-bin-23
        ];
      })
      inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.faf-client
    ];
  };

  gtk.gtk3.bookmarks = [
    "file://${homeDirectory}/Documents"
    "file://${homeDirectory}/Music"
    "file://${homeDirectory}/Pictures"
    "file://${homeDirectory}/Videos"
    "file://${homeDirectory}/Downloads"
    "file://${homeDirectory}/Desktop"
  ];
}

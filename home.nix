{ config, pkgs, ... }:

let
  homeDirectory = "/home/karl";
in 
{
  imports = [
    ./home-manager/alacritty.nix
    ./home-manager/bash.nix
    ./home-manager/git.nix
    ./home-manager/hyprland.nix
    ./home-manager/starship.nix
    ./home-manager/theme.nix
    ./home-manager/waybar.nix
  ];

  home.username = "karl";
  home.homeDirectory = "/home/karl";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Utility
    thunderbird
    audacious
    gimp

    # Programming
    vscodium
    jetbrains.idea-ultimate
    jetbrains.rust-rover
    obsidian

    # Messaging
    signal-desktop
    telegram-desktop
    zapzap
    discord
    teamspeak5_client

    # Games
    lutris
    # inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.faf-client
  ];

  gtk.gtk3.bookmarks = [
    "file:///home"
    "file:///games"
    "file://${homeDirectory}/Documents"
    "file://${homeDirectory}/Music"
    "file://${homeDirectory}/Pictures"
    "file://${homeDirectory}/Videos"
    "file://${homeDirectory}/Downloads"
    "file://${homeDirectory}/Desktop"
  ];

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
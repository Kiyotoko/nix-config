{
  lib,
  config,
  pkgs,
  user,
  description,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "pluto";

  # Auto mount removable media.
  services.udisks2.enable = true;

  # Enable power profiels.
  services.power-profiles-daemon.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${user}" = {
    name = user;
    isNormalUser = true;
    description = description;
    extraGroups = [
      "users"
      "networkmanager"
      "wheel"
      "docker"
    ];
    useDefaultShell = true;
    initialPassword = "nixos"; # Change with ’passwd’
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.gc = {
    automatic = true;
    persistent = true;
    dates = "weekly";
    options = "-d --delete-older-than 30d";
  };
}

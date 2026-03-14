{
  lib,
  config,
  pkgs,
  user,
  description,
  ...
}:
let
  homeDir = "/home/${user}";
in
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
  networking.hostName = "earth"; # Define your hostname.

  # Enable hardware
  hardware.graphics.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.firmware = [ pkgs.linux-firmware ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable the trash folder.
  services.gvfs.enable = true;

  # Auto mount removable media.
  services.udisks2.enable = true;

  # Update Framework BIOS
  services.fwupd.enable = true;

  # Disable Lid close events on Framework
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitchExternalPower = "ignore";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${user}" = {
    name = user;
    isNormalUser = true;
    description = description;
    extraGroups = [
      "audio"
      "networkmanager"
      "wheel"
      "libvirtd"
      "cdrom"
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
  system.stateVersion = "25.11"; # Did you read the comment?
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}

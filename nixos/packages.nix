{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # -----------------------------------------------------
    # Dev tools
    # -----------------------------------------------------
    python3
    typst
    gnumake

    # -----------------------------------------------------
    # System tools
    # -----------------------------------------------------
    home-manager
    fastfetch
    gparted
    tree
    wget
    unzip
    zip
    passh
    glow
    bat

    # -----------------------------------------------------
    # Network
    # -----------------------------------------------------
    networkmanager
  ];
}

{ pkgs, ... }:

{
  # Install hyprland and waybar
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.waybar.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Install steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    protontricks.enable = true;
    package = with pkgs; steam.override {
      extraPkgs = pkgs: [
        jq
        cabextract
        wget 
      ];
    };
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # -----------------------------------------------------
    # Dev tools
    # -----------------------------------------------------
    gradle
    maven
    python3
    python312Packages.pip
    python312Packages.dbus-python
    python312Packages.venvShellHook
    texliveFull
    gnumake
    gparted
    cmake

    # -----------------------------------------------------
    # System tools
    # -----------------------------------------------------
    home-manager
    fastfetch
    tree
    wget
    unzip
    zip
    passh
    glow
    pywal
    ntfs3g

    # -----------------------------------------------------
    # Audio
    # -----------------------------------------------------
    kdePackages.k3b # burn audio cd
    pavucontrol     # Open audio settings.
    mpd-small # music player server
    mpc # music player client

    # -----------------------------------------------------
    # Network
    # -----------------------------------------------------
    networkmanager
    networkmanagerapplet

    # -----------------------------------------------------
    # Hyprland
    # -----------------------------------------------------
    hypridle
    hyprpaper
    hyprlock
    dunst
    wofi
    nemo-with-extensions
    nemo-emblems
    nemo-fileroller
    folder-color-switcher
    qalculate-qt
    swaynotificationcenter
  ];
}

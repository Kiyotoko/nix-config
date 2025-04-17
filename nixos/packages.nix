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
    package =
      with pkgs;
      steam.override {
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
    sass
    lua

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
    # Audio & Video
    # -----------------------------------------------------
    # Full-featured CD/DVD/Blu-ray burning and ripping application
    kdePackages.k3b
    # Network transparent access to files and data
    kdePackages.kio
    # KIO worker to access Google Drive
    kdePackages.kio-gdrive
    # Additional components to increase the functionality of KIO
    kdePackages.kio-extras
    # Highly portable CD/DVD/BluRay command line recording software
    cdrtools
    # Cross-platform media player and streaming server
    vlc
    pavucontrol # Open audio settings.
    mpd-small # The music player server.
    mpc # A music player client for mpd.

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
    hyprshot
    hyprpicker
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

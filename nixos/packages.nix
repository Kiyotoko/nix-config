{ pkgs, ... }:

{
  # enable sway/hyprland & waybar
  programs.sway = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.waybar = {
    enable = true;
  };

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
    ### Development tools ###
    gradle
    maven
    python3
    python312Packages.pip
    python312Packages.dbus-python
    python312Packages.venvShellHook
    texliveFull
    gnumake
    cmake
    meson
    cpio

    ### System tools ###
    home-manager # managing user files
    alacritty # terminal emulator
    wofi # launcher for hyprland
    nautilus # file manager
    gparted # partition manager
    playerctl # audio service
    networkmanager # network tools
    networkmanagerapplet
    tree # tree view of folder
    wget
    unzip
    zip
    passh
    glow

    ### Hyperland ###
    hyprpaper
    hyprlang
    hyprsunset
    hyprlock
    hypridle
    hyprcursor
    hyprshot
    hyprutils
  ];
}

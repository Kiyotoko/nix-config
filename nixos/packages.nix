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

    ### System tools ###
    home-manager # managing user files
    wofi # launcher for sway
    gparted # partition manager
    playerctl # audio service
    networkmanager # network tools
    networkmanagerapplet
    pavucontrol # audio tools
    mpd-small # music player server
    mpc # music player client
    tree # tree view of folder
    wget
    unzip
    zip
    passh
    glow

    ### Sway functionality ###
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    mako # notification system developed by swaywm maintainer
  ];
}

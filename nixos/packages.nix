{ pkgs, ... }:

{
  # Install hyprland and waybar
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.waybar.enable = true;

  # Install firefox.
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      Preferences = {
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.contentblocking.category" = "strict";
        "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
        "cookiebanners.service.mode" = 2; # Block cookie banners
        "privacy.history.custom" = true;
        "privacy.globalprivacycontrol.was_ever_enabled" = true;
        "privacy.clearOnShutdown_v2.formdata" = true;
        "privacy.clearOnShutdown_v2.siteSettings" = true;
        "privacy.donottrackheader.enabled" = true;
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4371820/return_youtube_dislikes-3.0.0.18.xpi";
          installation_mode = "force_installed";
        };
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4465727/sponsorblock-5.11.10.xpi";
          installation_mode = "force_installed";
        };
        "leechblockng@proginosko.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4466262/leechblock_ng-1.6.9.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };

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
    python3
    python312Packages.pip
    python312Packages.dbus-python
    python312Packages.venvShellHook
    texliveFull
    gnumake
    cmake
    nushell
    go

    # -----------------------------------------------------
    # Language server
    # -----------------------------------------------------
    gopls
    mdx-language-server
    kotlin-language-server
    kotlin-language-server
    astro-language-server
    yaml-language-server
    tailwindcss-language-server
    lua-language-server
    java-language-server
    nil
    # Standalone command line tools for C++ development, contains clangd
    clang-tools

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
    # Tool for recording audio or data CD-Rs in disk-at-once (DAO) mode
    cdrdao
    # Portable command-line CD/DVD recorder software, mostly compatible with cdrtools
    cdrkit
    # Cross-platform media player and streaming server
    vlc
    # PulseAudio Volume Control
    pavucontrol

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
    swaylock
    hyprshot
    hyprpicker
    # Wayland based logout menu
    wlogout
    # Transparency for wlogout
    gtk-layer-shell
    # Lightweight and customizable notification daemon
    dunst
    # This program allows you read and control device brightness
    brightnessctl
    wofi
    nemo-with-extensions
    nemo-emblems
    nemo-fileroller
    folder-color-switcher
    qalculate-qt
    swaynotificationcenter
  ];
}

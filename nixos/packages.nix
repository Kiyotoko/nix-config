{ pkgs, ... }:

{
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
    typst
    gnumake
    cmake
    nushell
    temurin-bin
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
  ];
}

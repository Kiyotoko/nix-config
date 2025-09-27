{
  lib,
  config,
  pkgs,
  user,
  description,
  ...
}:
let
  hostName = "pluto";
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # ./mailserver.nix
    ./min-packages.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  security.rtkit.enable = true;
  security.acme = {
    acceptTerms = true;
    defaults.email = "contact@zschiebsch.org";
  };
  networking = {
    hostName = hostName; # Define your hostname.
    # wireless.enable = true; # Enables wireless support via wpa_supplicant.

    firewall.allowedTCPPorts = [
      22
      64
      80
      443
    ];
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable hardware
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable the trash folder.
  services.gvfs.enable = true;

  # Auto mount removable media.
  services.udisks2.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable power profiels.
  services.power-profiles-daemon.enable = true;

  # https://about.gitea.com/
  services.gitea = {
    enable = true;
    lfs.enable = true;
  };

  # Nextcloud
  environment.etc."nextcloud-admin-pass".text = "aa9eg1adlg";
  services.nextcloud = {
    enable = true;
    hostName = "localhost";
    database.createLocally = true;
    configureRedis = true;
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    config.dbtype = "sqlite";
    settings = {
      default_phone_region = "DE";
      trusted_proxies = [ "127.0.0.1" ];
    };
  };
  # Checkout issue github.com/NixOS/nixpkgs/issues/48045
  systemd.services.nextcloud-setup.serviceConfig = {
    RequiresMountsFor = [ "var/lib/nextcloud" ];
  };

  services.nginx = {
    enable = true;
    virtualHosts."zschiebsch.org" = {
      addSSL = true;
      enableACME = true;
      root = "/var/www/zschiebsch.org";  
    };
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  services.ddclient = {
    enable = true;
    ssl = true;
    use = "web, web=https://cloudflare.com/cdn-cgi/trace";
    interval = "5min";
    protocol = "cloudflare";
    passwordFile = "/var/ddclient/api-token";
    domains = [ "zschiebsch.org" ];
  };

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
  users.extraGroups.docker.members = [ "${user}" ];

  virtualisation.docker.enable = true;

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

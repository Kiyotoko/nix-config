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
    bat

    # -----------------------------------------------------
    # Network
    # -----------------------------------------------------
    networkmanager

    # -----------------------------------------------------
    # Home Server
    # -----------------------------------------------------
    # Authelia is an open-source authentication and
    # authorization server providing two-factor
    # authentication and single sign-on (SSO) for your
    # applications via a web portal. It acts as a
    # companion for reverse proxies like nginx, Traefik,
    # caddy or HAProxy to let them know whether requests
    # should either be allowed or redirected to
    # authelia’s portal for authentication.
    authelia
  ];
}

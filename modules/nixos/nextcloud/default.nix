{ pkgs, ... }:
{
  # Nextcloud
  environment.etc."nextcloud-admin-pass".text = "aa9eg1adlg";
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    hostName = "localhost";
    database.createLocally = true;
    configureRedis = true;
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    config.dbtype = "sqlite";
    settings = {
      default_phone_region = "DE";
      trusted_proxies = [ "127.0.0.1" ];
      trusted_domains = [ "nextcloud.zschiebsch.org" ]
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "nextcloud-31.0.14"
  ];

  # Checkout issue github.com/NixOS/nixpkgs/issues/48045
  systemd.services.nextcloud-setup.serviceConfig = {
    RequiresMountsFor = [ "var/lib/nextcloud" ];
  };

  # Redirect nextcloud to different host
  services.nginx.virtualHosts."localhost".listen = [
    {
      addr = "127.0.0.1";
      port = 8080;
    }
  ];

  networking.firewall.allowedTCPPorts = [
    8080
  ];
}

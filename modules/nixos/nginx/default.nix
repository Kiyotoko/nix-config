{
  services.nginx = {
    enable = true;
    virtualHosts."www.zschiebsch.org" = {
      addSSL = true;
      enableACME = true;
      root = "/var/www/www.zschiebsch.org";
    };
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}

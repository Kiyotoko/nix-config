{ ... }:
{
  # https://about.gitea.com/
  services.gitea = {
    enable = true;
    lfs.enable = true;
  };

  networking.firewall.allowedTCPPorts = [
    3000
  ];
}

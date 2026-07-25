{ pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
    plugins = [
      pkgs.networkmanager-openvpn
    ];
  };

  users.users."${users}".extraGroups = [ "networkmanager" ];
}

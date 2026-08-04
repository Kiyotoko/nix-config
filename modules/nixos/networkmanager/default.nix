{ pkgs, user, ... }:
{
  networking.networkmanager = {
    enable = true;
    plugins = [
      pkgs.networkmanager-openvpn
    ];
  };

  users.users."${user}".extraGroups = [ "networkmanager" ];
}

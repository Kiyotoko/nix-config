{ lib, ... }:
{
  services.dunst = {
    enable = true;
    settings = lib.mkDefault (lib.importTOML ./dunstrc.toml);
  };
}
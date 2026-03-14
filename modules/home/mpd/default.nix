{ lib, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
    extraConfig = builtins.readFile ./mpd.conf;
  };
}

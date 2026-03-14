{ ... }:
{
  programs.swaylock.enable = true;

  home.file.".config/swaync/config" = {
    source = ./config;
  };
}

{ ... }:

{
  home.file.".config/waybar/config" = {
    source = ./waybar/config;
    recursive = true;
  };
  home.file.".config/waybar/style.css" = {
    source = ./waybar/style.css;
    recursive = true;
  };
}
{ ... }:
{
  programs.wofi.enable = true;

  home.file = {
    ".config/wofi" = {
      source = ./config;
      recursive = true;
    };
  };
}

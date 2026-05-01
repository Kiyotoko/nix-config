{ pkgs, ... }:
let
  iconTheme = "Papirus";
  iconPackage = pkgs.papirus-icon-theme;
  gtkTheme = "WhiteSur-Dark-solid";
  gtkPackage = pkgs.whitesur-gtk-theme;
  cursorTheme = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
in
{
  home = {
    packages = [
      iconPackage
      gtkPackage
      pkgs.font-awesome
      pkgs.ubuntu-classic
      pkgs.arkpandora_ttf
      pkgs.liberation_ttf
      pkgs.nerd-fonts.ubuntu
    ];
    sessionVariables = {
      XCURSOR_THEME = cursorTheme;
      XCURSOR_SIZE = "24";
    };
    pointerCursor = {
      package = cursorPackage;
      name = cursorTheme;
      size = 24;
      gtk.enable = true;
    };
    file.".local/share/icons/${iconTheme}" = {
      source = "${iconPackage}/share/icons/${iconTheme}";
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    theme.name = gtkTheme;
    cursorTheme = {
      name = cursorTheme;
      package = cursorPackage;
    };
    iconTheme.name = iconTheme;
  };
}

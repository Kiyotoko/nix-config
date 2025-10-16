{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  iconTheme = "Papirus";
  iconPackage = pkgs.papirus-icon-theme;
  gtkTheme = "WhiteSur-Dark-solid";
  gtkPackage = pkgs.whitesur-gtk-theme;
  cursorTheme = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
  nerdFonts = with pkgs.nerd-fonts; [
    ubuntu
    ubuntu-mono
    fantasque-sans-mono
    fira-code
    mononoki
  ];
in
{
  home = {
    packages =
      with pkgs;
      [
        fontconfig
        font-awesome
        jetbrains-mono
        iconPackage
        gtkPackage
      ]
      ++ nerdFonts;
    sessionVariables = {
      XCURSOR_THEME = cursorTheme;
      XCURSOR_SIZE = "24";
      SDL_VIDEODRIVER = "'wayland,x11'";
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

    activation.updateFontCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${pkgs.fontconfig}/bin/fc-cache -fv
    '';
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    font.name = "Ubuntu Nerd Font";
    theme.name = gtkTheme;
    cursorTheme = {
      name = cursorTheme;
      package = cursorPackage;
    };
    iconTheme.name = iconTheme;
  };
}

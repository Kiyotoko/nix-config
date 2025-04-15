{ pkgs, inputs, ... }:
let
  iconTheme = "Papirus";
  iconPackage = pkgs.papirus-icon-theme;
  gtkTheme = "WhiteSur-Dark-solid";
  gtkPackage = pkgs.whitesur-gtk-theme;
  cursorTheme = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
  nerdfonts = (
    pkgs.nerdfonts.override {
      fonts = [
        "Ubuntu"
        "UbuntuMono"
        "CascadiaCode"
        "FantasqueSansMono"
        "FiraCode"
        "Mononoki"
      ];
    }
  );
in
{
  home = {
    packages = with pkgs; [
      font-awesome
      nerdfonts
      jetbrains-mono
      iconPackage
      gtkPackage
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
    file = {
      ".local/share/fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
      ".fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
      ".local/share/icons/${iconTheme}" = {
        source = "${iconPackage}/share/icons/${iconTheme}";
      };
    };
  };

  gtk = {
    enable = true;
    font.name = "Ubuntu Nerd Font";
    theme.name = gtkTheme;
    cursorTheme = {
      name = cursorTheme;
      package = cursorPackage;
    };
    iconTheme.name = iconTheme;
    gtk3.extraCss = ''
      headerbar, .titlebar,
      .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
        border-radius: 0;
      }
    '';
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
  };
}

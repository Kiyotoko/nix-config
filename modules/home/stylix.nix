{
  lib,
  pkgs,
  user,
  ...
}:

{
  stylix = {
    enable = true;
    base16Scheme = ./.schemes/latte.yaml;
    polarity = "light";

    targets = {
      nixcord.enable = true; # Discord
      firefox.profileNames = [ "${user}" ];
      librewolf = {
        enable = true;
        colorTheme.enable = true;
        firefoxGnomeTheme.enable = true;
        profileNames = [ "${user}" ];
      };
      gtk.enable = false;
      obsidian = {
        enable = true;
        vaultNames = [
          "vault-uni"
          "vault-sek2"
        ];
      };
      vscode.enable = true;
    };

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}

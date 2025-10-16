{
  lib,
  pkgs,
  user,
  ...
}:

{
  stylix = lib.mkDefault ({
    enable = true;
    base16Scheme = ./.schemes/ghibli.yaml;
    polarity = "light";

    targets.firefox.profileNames = [ "${user}" ];
    targets.gtk.enable = false;
    targets.vscode.enable = false;
    targets.gnome.enable = false;

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
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  });
}

{ pkgs, ... }:
{
  projectRootFile = "flake.nix";
  settings.excludes = [
    "**/dunst/*"
    "**/kdedefaults/*"
    "*.png"
    "*.conf"
    "*.gitignore"
    "*.toml"
    "Makefile"
    "**/waybar/themes/ml4w-minimal/style.css"
    "*.envrc"
  ];

  programs = {
    nixfmt.enable = pkgs.lib.meta.availableOn pkgs.stdenv.buildPlatform pkgs.nixfmt-rfc-style.compiler;
    shellcheck.enable = true;
    prettier.enable = true;
  };

  settings = {
    formatter.prettier.options = [ "--write" ];
  };
}

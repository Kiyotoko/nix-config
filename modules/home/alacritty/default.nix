{
  config,
  inputs,
  lib,
  lib-flake,
  pkgs,
  ...
}:
let
  cfg = config.kiyo.alacritty;
  tomlFormat = pkgs.formats.toml { };
in
{
  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  options.kiyo.alacritty = {
    enable = lib-flake.kiyo.mkEnableDefault "Alacritty" true;
    package = lib.mkPackageOption pkgs "alacritty" { };
    settings = lib.mkOption {
      type = tomlFormat.type;
      default = {
        env.TERM = "xterm-256color";
        font = {
          size = 12;
        };
        scrolling.multiplier = 5;
        selection.save_to_clipboard = true;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      package = cfg.package;
      settings = cfg.settings;
    };
  };
}

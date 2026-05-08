{
  config,
  lib,
  lib-flake,
  pkgs,
  ...
}:
let
  cfg = config.kiyo.alacritty;
in
{
  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  options.kiyo.alacritty = {
    enable = lib-flake.kiyo.mkEnableDefault "Alacritty" true;
    package = lib.mkPackageOption pkgs "alacritty" { };
    settings =
      lib-flake.kiyo.mkTomlOption pkgs
        ''
          Configuration written to
          {file}`$XDG_CONFIG_HOME/alacritty/alacritty.yml` or
          {file}`$XDG_CONFIG_HOME/alacritty/alacritty.toml`
          (the latter being used for alacritty 0.13 and later).
          See <https://github.com/alacritty/alacritty/tree/master#configuration>
          for more info.
        ''
        {
          env.TERM = "xterm-256color";
          font = {
            size = 12;
          };
          scrolling.multiplier = 5;
          selection.save_to_clipboard = true;
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

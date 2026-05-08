{ 
  config,
  lib,
  lib-flake,
  pkgs,
  ...
}:
let
  cfg = config.kiyo.dunst;
in
{
  options.kiyo.dunst = {
    enable = lib-flake.kiyo.mkEnableDefault "Bash" true;
    settings = lib-flake.kiyo.mkTomlOption pkgs "" (lib.importTOML ./dunstrc.toml);
  };
  config = lib.mkIf cfg.enable {
    services.dunst = {
      enable = true;
      settings = cfg.settings;
    };
  };
}
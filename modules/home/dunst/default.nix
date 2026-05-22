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
    enable = lib-flake.kiyo.mkEnableDefault "Dunst" true;
    # Thanks to Bina for the config file
    settings = lib-flake.kiyo.mkTomlOption pkgs "Your dunst config, default is dunstrc.toml file." (lib.importTOML ./dunstrc.toml);
  };
  config = lib.mkIf cfg.enable {
    services.dunst = {
      enable = true;
      settings = cfg.settings;
    };
  };
}
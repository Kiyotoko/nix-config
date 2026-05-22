{
  config,
  lib,
  lib-flake,
  pkgs,
  ...
}:
let
  cfg = config.kiyo.fastfetch;
in
{
  options.kiyo.fastfetch = {
    enable = lib-flake.kiyo.mkEnableDefault "FastFetch" true;
    settings = lib-flake.kiyo.mkTomlOption pkgs "Your fastfetch config, default is config.jsonc" (
      lib.importJSON ./config.json
    );
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
      settings = cfg.settings;
    };
  };
}

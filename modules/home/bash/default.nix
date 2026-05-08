{
  config,
  lib,
  lib-flake,
  ...
}:
let
  cfg = config.kiyo.bash;
in
{
  options.kiyo.bash = {
    enable = lib-flake.kiyo.mkEnableDefault "Bash" true;
  };

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        get = "curl";
        post = "curl -d";
        typ = "typst watch --root .";
      };
    };
  };
}

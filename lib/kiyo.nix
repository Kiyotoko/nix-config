{
  lib,
  ...
}:
rec {
  mkEnableDefault =
    description: default:
    lib.mkOption {
      inherit description default;
      type = lib.types.bool;
    };

  mkTomlOption =
    pkgs: description: default:
    let
      tomlFormat = pkgs.formats.toml { };
    in
    lib.mkOption {
      type = tomlFormat.type;
      inherit description default;
    };

  mkJsonOption =
    pkgs: description: default:
    let
      jsonFormat = pkgs.formats.json { };
    in
    lib.mkOption {
      type = jsonFormat.type;
      inherit description default;
    };
}

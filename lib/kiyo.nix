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
}

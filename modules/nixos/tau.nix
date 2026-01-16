{ inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.tau-lang.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.ochtendzon.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
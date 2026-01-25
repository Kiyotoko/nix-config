{ inputs, pkgs, ... }:

let
  tau-lang = inputs.tau-lang.packages.${pkgs.stdenv.hostPlatform.system};
  ochtendzon = inputs.ochtendzon.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  environment.systemPackages = [
    tau-lang.default
    tau-lang.tau-manpages
    ochtendzon.default
    ochtendzon.ochtendzon-manpages
  ];
}

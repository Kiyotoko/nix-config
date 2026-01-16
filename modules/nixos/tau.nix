{ inputs, system, ... }:

{
  environment.systemPackages = [
    inputs.tau-lang.${system}.default
    inputs.ochtendzon.${system}.default
  ];
}
{ pkgs, ... }:
{
  environment.systemPackages = [
    # https://wiki.nixos.org/wiki/Prism_Launcher
    (pkgs.prismlauncher.override {
      # Change Java runtimes available to Prism Launcher
      jdks = [
        pkgs.zulu8
        pkgs.zulu17
        pkgs.zulu25
      ];
    })
  ];
}

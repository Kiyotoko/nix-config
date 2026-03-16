{ pkgs, ... }:

{
  services.passSecretService.enable = true;
  environment.systemPackages = [
    pkgs.pinentry-curses
    pkgs.pass-wayland
  ];
}

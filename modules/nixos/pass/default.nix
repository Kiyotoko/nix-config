{ pkgs, ... }:

{
  services.passSecretService.enable = true;
  environment.systemPackages = [
    pkgs.pass-wayland
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}

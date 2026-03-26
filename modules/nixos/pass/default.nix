{ pkgs, ... }:

{
  services.passSecretService.enable = true;
  environment.systemPackages = [
    pkgs.pass
    pkgs.qtpass
    pkgs.passExtensions.pass-import
    pkgs.passExtensions.pass-update
    pkgs.passExtensions.pass-audit
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}

{ pkgs, ... }:

{
  services.passSecretService.enable = true;
  environment.systemPackages = [
    (pkgs.pass.withExtensions (
      ext: with ext; [
        pass-import
        pass-update
        pass-audit
      ]
    ))
    pkgs.qtpass
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}

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
    pkgs.wl-clipboard # required for copying passwords in Wayland
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}

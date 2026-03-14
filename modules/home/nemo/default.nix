{ pkgs, user, ... }:
{
  home.packages = [
    pkgs.nemo-with-extensions
    pkgs.nemo-emblems
    pkgs.nemo-fileroller
    pkgs.folder-color-switcher
  ];

  services.udiskie = {
    enable = true;
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
      };
    };
  };

  gtk.gtk3.bookmarks =
    let
      homeDir = "/home/${user}";
    in
    [
      "file://${homeDir}/Documents"
      "file://${homeDir}/Books"
      "file://${homeDir}/Audiobooks"
      "file://${homeDir}/Movies"
      "file://${homeDir}/Music"
      "file://${homeDir}/Pictures"
      "file://${homeDir}/Videos"
      "file://${homeDir}/Downloads"
      "file://${homeDir}/Desktop"
    ];
}

{
  pkgs,
  inputs,
  user,
  ...
}:
let
  homeDir = "/home/${user}";
in
{
  imports = [
    ./theme.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "${homeDir}";

    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.11";

    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      # Utility
      thunderbird
      audacious
      pix
      gimp

      # Programming
      obsidian
      godot_4

      # Messaging
      signal-desktop
      telegram-desktop
      iamb
      discord
    ];

    file = {
      ".config" = {
        source = ./.config;
        recursive = true;
      };
    };
  };

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

  gtk.gtk3.bookmarks = [
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

{ pkgs, user, ... }:
{
  programs.k3b.enable = true;

  environment.systemPackages = with pkgs; [
    # Network transparent access to files and data
    kdePackages.kio
    # Additional components to increase the functionality of KIO
    kdePackages.kio-extras
    # Highly portable CD/DVD/BluRay command line recording software
    cdrtools
    # Portable command-line CD/DVD recorder software, mostly compatible with cdrtools
    cdrkit
  ];

  users.users."${user}".extraGroups = [ "cdrom" "disk" ];

  # Realtime scheduling priority to user processes
  security.rtkit.enable = true;
}

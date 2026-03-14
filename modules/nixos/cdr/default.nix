{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Full-featured CD/DVD/Blu-ray burning and ripping application
    kdePackages.k3b
    # Network transparent access to files and data
    kdePackages.kio
    # KIO worker to access Google Drive
    kdePackages.kio-gdrive
    # Additional components to increase the functionality of KIO
    kdePackages.kio-extras
    # Highly portable CD/DVD/BluRay command line recording software
    cdrtools
    # Tool for recording audio or data CD-Rs in disk-at-once (DAO) mode
    cdrdao
    # Portable command-line CD/DVD recorder software, mostly compatible with cdrtools
    cdrkit
  ];
}

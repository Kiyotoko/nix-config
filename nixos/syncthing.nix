{
  user,
  homeDir,
  ...
}:

{
  # Enable syncthing accross multiple devices.
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true"; # Don't create default ~/Sync folder
  services.syncthing = {
    enable = true;
    dataDir = homeDir;
    openDefaultPorts = true;
    configDir = "${homeDir}/.config/syncthing";
    user = user;
    group = "users";
    guiAddress = "0.0.0.0:8384";
    overrideFolders = true;
    settings = {
      folders = {
        "Audiobooks" = {
          path = "${homeDir}/Audiobooks";
          versioning = {
            type = "simple";
          };
        };
        "Books" = {
          path = "${homeDir}/Books";
          versioning = {
            type = "simple";
          };
        };
        "Movies" = {
          path = "${homeDir}/Movies";
          versioning = {
            type = "simple";
          };
        };
        "Music" = {
          path = "${homeDir}/Music";
          versioning = {
            type = "simple";
          };
        };
        "Pictures" = {
          path = "${homeDir}/Pictures";
          versioning = {
            type = "simple";
          };
        };
        "Videos" = {
          path = "${homeDir}/Videos";
          versioning = {
            type = "simple";
          };
        };
      };
    };
  };
}

{ pkgs, ... }:
{
  home = {
    packages = [
      pkgs.iamb
    ];

    file = {
      ".config/iamb/config.toml" = {
        source = ./config.toml;
      };
    };
  };
}

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      conf = "make -sC ~/Documents/Kiyotoko/nix-config/";
    };
  };
}

{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      rb = "sudo nixos-rebuild switch --flake .";
    };
  };
}
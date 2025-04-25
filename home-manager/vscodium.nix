{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      golang.go
      sumneko.lua
      redhat.java
      rebornix.ruby
      tiehuis.zig
      ms-vscode.cpptools
      dotjoshjohnson.xml
      esbenp.prettier-vscode
      jgclark.vscode-todo-highlight
      mechatroner.rainbow-csv
      bbenoist.nix
    ];
  };
}

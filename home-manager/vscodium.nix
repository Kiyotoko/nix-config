{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      golang.go
      sumneko.lua
      redhat.java
      rebornix.ruby
      jgclark.vscode-todo-highlight
      mechatroner.rainbow-csv
    ];
  };
}
{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      golang.go
      sumneko.lua
      llvm-vs-code-extensions.vscode-clangd
      dotjoshjohnson.xml
      esbenp.prettier-vscode
      jgclark.vscode-todo-highlight
      mechatroner.rainbow-csv
      bbenoist.nix
      bradlc.vscode-tailwindcss
      ziglang.vscode-zig
    ];
  };
}

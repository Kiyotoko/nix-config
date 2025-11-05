{ pkgs, pkgs-unstable, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions =
        with pkgs.vscode-extensions;
        [
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
          rust-lang.rust-analyzer
        ]
        ++ [
          pkgs-unstable.vscode-extensions.oracle.oracle-java
        ];

      userSettings = {
        "explorer.confirmDelete" = false;
        "editor.wordWrap" = "on";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.tabSize" = 2;
        "editor.autoIndentOnPaste" = true;
        "todohighlight.include" = [
          "**/*.js"
          "**/*.jsx"
          "**/*.ts"
          "**/*.tsx"
          "**/*.html"
          "**/*.css"
          "**/*.scss"
          "**/*.md"
          "**/*.c"
          "**/*.cpp"
          "**/*.h"
          "**/*.hpp"
          "**/*.rs"
          "**/*.java"
        ];
      };
    };
  };

  home.packages = with pkgs; [
    # -----------------------------------------------------
    # Language server
    # -----------------------------------------------------
    gopls
    mdx-language-server
    kotlin-language-server
    kotlin-language-server
    astro-language-server
    yaml-language-server
    tailwindcss-language-server
    lua-language-server
    java-language-server
    nil
    # Standalone command line tools for C++ development, contains clangd
    clang-tools
    rust-analyzer
    # Tinymist is an integrated language service for Typst
    tinymist
  ];
}

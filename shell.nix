{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    gnumake
    treefmt
    nixfmt-rfc-style
  ];
}

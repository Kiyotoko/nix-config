{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    git
    gnumake
    treefmt
    nixfmt-rfc-style
    shfmt
    shellcheck
    # prettier-d-slim
    nodePackages.prettier
  ];
}

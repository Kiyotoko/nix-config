.PHONY: nixos home

nixos:
	sudo nixos-rebuild switch --flake . --impure

home:
	export NIXPKGS_ALLOW_UNFREE=1 && home-manager switch --flake . -b backup --impure

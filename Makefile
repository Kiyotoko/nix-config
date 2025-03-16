nixos:
	sudo nixos-rebuild switch --flake .

home:
	home-manager switch --flake .

.PHONY: nixos home

all: help

format:	## Format all files in your configuration
	@nix-shell --run "treefmt"

help:	## Displays this help message
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

home:	## Rebuilds your user home folder
	@home-manager switch --flake . -b back --impure

nixos:	## Rebuilds your system configuration
	@sudo nixos-rebuild switch --flake . --impure

nixos-laptop:	## Rebuild your laptop system
	@sudo nixos-rebuild switch --flake .#nixos-laptop --impure

nixos-pc:	## Rebuild your pc system
	@sudo nixos-rebuild switch --flake .#nixos-pc --impure

open:	## Opens your config folder in bash
	@echo -e "+---------------------+\n| \033[1m\033[94mNixOS Configuration\033[0m |\n+---------------------+\n\nYour config is located here:"
	@sh -c "pwd && bash"

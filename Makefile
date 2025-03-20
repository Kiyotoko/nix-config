.PHONY: nixos home

all: help

help:	## Displays this help message
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

home:	## Rebuilds your user home folder
	@export NIXPKGS_ALLOW_UNFREE=1 && home-manager switch --flake . -b backup --impure

nixos:	## Rebuilds your system configuration
	@sudo nixos-rebuild switch --flake . --impure

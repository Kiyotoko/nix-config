{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nix-gaming.url = "github:fufexan/nix-gaming";
    
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "hyprland";
    };
    more-waita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };
  };

  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./configuration.nix
      ];
    };
  };
}

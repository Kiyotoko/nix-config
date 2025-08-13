{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    utils.url = "github:numtide/flake-utils";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "hyprland";
    };
  };

  outputs =
    {
      nixpkgs,
      utils,
      nixos-hardware,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      defaultModules = [
        stylix.nixosModules.stylix
        ./nixos/packages.nix
        ./nixos/hyprland.nix
        ./nixos/librewolf.nix
        ./nixos/stylix.nix
        ./nixos/syncthing.nix
      ];
      user = "karl";
      description = "Karl Zschiebsch";
      homeDir = "/home/${user}";
    in
    {
      nixosConfigurations."earth" = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = {
          inherit inputs;
          inherit user;
          inherit description;
          inherit homeDir;
        };
        modules = [
          nixos-hardware.nixosModules.framework-amd-ai-300-series
          ./nixos/earth/configuration.nix
        ]
        ++ defaultModules;
      };

      nixosConfigurations."mars" = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = {
          inherit inputs;
          inherit user;
          inherit description;
          inherit homeDir;
        };
        modules = [
          nixos-hardware.nixosModules.gigabyte-b550
          ./nixos/mars/configuration.nix
        ]
        ++ defaultModules;
      };

      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit user;
          inherit homeDir;
        };
        modules = [ ./home-manager/home.nix ];
      };

      templates = {
        rust = {
          name = "Rust";
          path = ./templates/rust;
        };
        zig = {
          name = "Zig";
          path = ./templates/zig;
        };
      };

      devShell.${system} = pkgs.mkShell {
        name = "config";

        nativeBuildInputs = with pkgs; [
          git
          gnumake

          # Formatter
          treefmt
          nixfmt-rfc-style
          shfmt
          shellcheck
          nodePackages.prettier
        ];
      };
    };
}

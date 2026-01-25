{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    utils.url = "github:numtide/flake-utils";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "hyprland";
    };

    tau-lang.url = "github:tau-lang/tau";
    ochtendzon.url = "github:tau-lang/ochtendzon";
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
      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      nixos-modules = [
        stylix.nixosModules.stylix
        ./nixos/packages.nix
        ./modules/nixos/hyprland
        ./modules/nixos/pass
        ./modules/nixos/pipewire
        ./modules/nixos/stylix
        ./modules/nixos/syncthing
      ];
      user = "karl";
      description = "Karl Zschiebsch";
    in
    {
      nixosConfigurations."earth" = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = {
          inherit inputs;
          inherit user;
          inherit description;
        };
        modules = [
          nixos-hardware.nixosModules.framework-amd-ai-300-series
          ./nixos/earth/configuration.nix
          ./modules/nixos/tau
        ]
        ++ nixos-modules;
      };

      nixosConfigurations."mars" = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = {
          inherit inputs;
          inherit user;
          inherit description;
        };
        modules = [
          nixos-hardware.nixosModules.gigabyte-b550
          ./nixos/mars/configuration.nix
          ./modules/nixos/steam
        ]
        ++ nixos-modules;
      };

      nixosConfigurations."pluto" = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = {
          user = "admin";
          description = "Admin";
        };
        modules = [
          ./nixos/pluto/configuration.nix
        ];
      };

      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit user;
          inherit pkgs-unstable;
        };
        modules = [
          stylix.homeModules.stylix
          ./home/karl/home.nix
          ./modules/home/alacritty
          ./modules/home/bash
          ./modules/home/git
          ./modules/home/helix
          ./modules/home/librewolf
          ./modules/home/starship
          ./modules/home/stylix
          ./modules/home/vscodium
          ./modules/home/waybar
          ./modules/home/wofi
        ];
      };

      templates = {
        rust = {
          description = "Rust Template";
          path = ./templates/rust;
        };
        zig = {
          description = "Zig Template";
          path = ./templates/zig;
        };
      };

      devShells.${pkgs.hostPlatform.system}.default = pkgs.mkShell {
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

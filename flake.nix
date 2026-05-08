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
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "hyprland";
    };
    treefmt-nix.url = "github:numtide/treefmt-nix";

    tau-lang.url = "github:tau-lang/tau";
    ochtendzon.url = "github:tau-lang/ochtendzon";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      stylix,
      treefmt-nix,
      ...
    }@inputs:
    let
      eachSystem = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      treefmtEval = eachSystem (
        system: treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} ./treefmt.nix
      );
      nixos-modules = [
        stylix.nixosModules.stylix
        ./nixos/packages.nix
        ./modules/nixos/bluetooth
        ./modules/nixos/german
        ./modules/nixos/git
        ./modules/nixos/pass
        ./modules/nixos/stylix
        { nixpkgs.config.allowUnfree = true; }
      ];
      user = "karl";
      description = "Karl Zschiebsch";
    in
    {
      nixosConfigurations."earth" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit user;
          inherit description;
        };
        modules = [
          nixos-hardware.nixosModules.framework-amd-ai-300-series
          ./nixos/earth/configuration.nix
          ./modules/nixos/hyprland
          ./modules/nixos/pipewire
          ./modules/nixos/printing
          ./modules/nixos/syncthing
          ./modules/nixos/tau
        ]
        ++ nixos-modules;
      };

      nixosConfigurations."mars" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit user;
          inherit description;
        };
        modules =
          let
            hardware = nixos-hardware.nixosModules;
          in
          [
            hardware.gigabyte-b550
            hardware.common-pc
            hardware.common-pc-ssd
            ./nixos/mars/configuration.nix
            ./modules/nixos/cdr
            ./modules/nixos/hyprland
            ./modules/nixos/minecraft
            ./modules/nixos/pipewire
            ./modules/nixos/steam
            ./modules/nixos/syncthing
          ]
          ++ nixos-modules;
      };

      nixosConfigurations."pluto" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          user = "admin";
          description = "Admin";
        };
        modules = [
          ./nixos/pluto/configuration.nix
          ./modules/nixos/acme
          ./modules/nixos/cloudflared
          ./modules/nixos/ddclient
          ./modules/nixos/docker
          ./modules/nixos/gitea
          ./modules/nixos/nextcloud
          ./modules/nixos/nginx
          ./modules/nixos/openssh
        ]
        ++ nixos-modules;
      };

      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs;
          inherit user;
        };
        modules = [
          stylix.homeModules.stylix
          ./home/karl/home.nix
          ./modules/home/alacritty
          ./modules/home/bash
          ./modules/home/dunst
          ./modules/home/fastfetch
          ./modules/home/git
          ./modules/home/helix
          ./modules/home/hyprland
          ./modules/home/iamb
          ./modules/home/librewolf
          ./modules/home/mpd
          ./modules/home/nemo
          ./modules/home/starship
          ./modules/home/stylix
          ./modules/home/swaylock
          ./modules/home/swaync
          ./modules/home/vscodium
          ./modules/home/waybar
          ./modules/home/wlogout
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
      devShells = eachSystem (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        {
          default = pkgs.mkShell {
            name = "config";
            nativeBuildInputs = with pkgs; [
              git
              gnumake
            ];
          };
        }
      );

      #Formatter
      formatter = eachSystem (system: treefmtEval.${system}.config.build.wrapper);
      checks = eachSystem (system: {
        formatting = treefmtEval.${system}.config.build.check self;
      });
    };
}

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
      home-manager,
      nixos-hardware,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      defaultModules = [
        ./nixos/configuration.nix
      ];
      user = "karl";
      description = "Karl Zschiebsch";
      homeDir = "/home/${user}";
    in
    {
      nixosConfigurations."nixos-laptop" = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = {
          inherit inputs;
          inherit user;
          inherit description;
          inherit homeDir;
          hostName = "nixos-laptop";
        };
        modules = [
          nixos-hardware.nixosModules.lenovo-legion-y530-15ich
        ]
        ++ defaultModules;
      };

      nixosConfigurations."nixos-pc" = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        specialArgs = {
          inherit inputs;
          inherit user;
          inherit description;
          inherit homeDir;
          hostName = "nixos-pc";
        };
        modules = [
          nixos-hardware.nixosModules.gigabyte-b550
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

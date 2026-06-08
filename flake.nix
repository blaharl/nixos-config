{
  description = "flake file";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence";
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    danksearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # outputs = inputs@{ nixpkgs, impermanence, home-manager, nixpkgs-unstable, ... }:
  outputs =
    inputs@{
      nixpkgs,
      impermanence,
      home-manager,
      nixpkgs-unstable,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      username = "user";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        debian = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            impermanence.nixosModules.impermanence
            ./system/import-desktop.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [
                inputs.dms.homeModules.dank-material-shell
                inputs.danksearch.homeModules.dsearch
              ];
              home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
              home-manager.users."${username}" = import ./config/desktop.nix;
            }
          ];
        };
        laptop = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            impermanence.nixosModules.impermanence
            ./system/import-laptop.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [
                inputs.dms.homeModules.dank-material-shell
                inputs.danksearch.homeModules.dsearch
              ];
              home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
              home-manager.users."${username}" = import ./config/laptop.nix;
            }
          ];
        };
      };
      # WIP
      homeConfigurations = {
        debian = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./config/desktop.nix
            {
              home = {
                inherit username;
                homeDirectory = "/home/${username}";
              };
            }
          ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./config/laptop.nix
            {
              home = {
                inherit username;
                homeDirectory = "/home/${username}";
              };
            }
          ];
        };
      };
    };
}

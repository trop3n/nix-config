{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    stylix.url = "github:danth/stylix/release-24.11";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nix-index-database, stylix, nixvim, flake-utils, ... }@inputs:
    
    let
      system = "x86_64-linux";
    in {

    nixosConfigurations.jason = nixpkgs.lib.nixosSystem {
      specialArgs = {
        wallpapers = "${self}/assets/wallpapers";
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration.nix
        inputs.nixvim.nixosModules.nixvim
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.jason = import ./home-manager/home.nix;
          };
        }
      ];
    };
    # homeConfigurations.jason = home-manager.lib.homeManagerConfiguration {
    #   pkgs = nixpkgs.legacyPackages.${system};
    #   modules = [
    #     ./home-manager/home.nix
    #   ];
    # };
    
    # nixosConfigurations = {
    #   nixos = nixpkgs.lib.nixosSystem {
    #     system = "x86_64-linux";
    #     specialArgs = { inherit inputs; };
    #     modules = [
    #       ./nixos/configuration.nix
    #       inputs.nixvim.nixosModules.nixvim
    #       inputs.stylix.nixosModules.stylix
    #       nix-index-database.nixosModules.nix-index
    #       home-manager.nixosModules.home-manager
    #       {
    #         home-manager.useGlobalPkgs = true;
    #         home-manager.useUserPackages = true;
    #         home-manager.extraSpecialArgs = { inherit inputs; };
    #         home-manager.users.jason = import ./home-manager/home.nix;
    #       }
    #     ];
    #   };
    # };
  };
}
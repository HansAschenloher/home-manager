{
  description = "My Home-manager configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:nix-community/stylix/release-25.11";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      stylix,
      nixvim,
      nix-index-database,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      user = import ./user.nix;
    in
    {
      homeConfigurations."ja@pc" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          self.homeModules.default
          self.homeModules.gaming
        ];
        extraSpecialArgs = {
          user = {
            id = "ja";
            fullName = "Johann Aschenloher";
            mail = "hansi.aschenloher@gmail.com";
          };
        };
      };

      homeModules = {
        default = {
          imports = [
            ./home.nix
            ./modules
            nixvim.homeModules.nixvim
            stylix.homeModules.stylix
            nix-index-database.homeModules.nix-index
            { programs.nix-index-database.comma.enable = true; }
          ];
        };
        gaming = {
          imports = [
            ./modules/gaming
          ];
        };
      };
    };
}

{
  description = "My Home-manager configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix/release-25.05";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
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
    in
    {
      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          self.homeManagerModules.default
        ];
        extraSpecialArgs = {
          user = {
            id = "ascj";
            fullName = "Johann Aschenloher";
            mail = "hansi.aschenloher@gmail.com ";
            computerName = "pc";
          };
        };
      };

      homeManagerModules.default = {
        imports = [
          ./home.nix
          ./modules
          nixvim.homeManagerModules.nixvim
          stylix.homeModules.stylix
          nix-index-database.hmModules.nix-index
          { programs.nix-index-database.comma.enable = true; }
        ];
      };
    };
}

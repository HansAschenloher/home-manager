{
  description = "My Home-manager configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake/main";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    stylix.url = "github:nix-community/stylix/release-26.05";
    nixvim-config = {
      #url = "github:HansAschenloher/nixvim-config";
      url = "path:/home/ascj/src/neovim-config";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      stylix,
      nix-index-database,
      niri,
      hytale-launcher,
      flake-parts,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            unstable.teamspeak3 = pkgs-unstable.teamspeak3;
          })
        ];
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      newConfig = flake-parts.lib.mkFlake { inherit inputs; } {
        imports = [
          inputs.home-manager.flakeModules.home-manager
          inputs.flake-parts.flakeModules.modules
          (inputs.import-tree ./modules)
        ];

        perSystem = {
          pkgs = import inputs.nixpkgs {
            system = pkgs.system;
            config.allowUnfree = true;
          };
        };
      };
    in
    newConfig;

  #{
  #homeConfigurations."ja@pc" = home-manager.lib.homeManagerConfiguration {
  #inherit pkgs;
  #modules = [
  #./hosts/pc
  #nixvim.homeModules.nixvim
  #stylix.homeModules.stylix
  #nix-index-database.homeModules.nix-index
  #{ home.packages = [ hytale-launcher.packages.${pkgs.system}.default ]; }
  #];
  #};

  #homeConfigurations."ascj@laptop" = home-manager.lib.homeManagerConfiguration {
  #inherit pkgs;
  #modules = [
  #./hosts/laptop
  #nixvim.homeModules.nixvim
  #stylix.homeModules.stylix
  #nix-index-database.homeModules.nix-index
  #niri.homeModules.niri
  #];
  #};
  #};
}

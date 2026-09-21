{ inputs, ownLib, ... }: {
  config.flake.homeConfigurations."laptop-ascj" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = with inputs.self.modules.homeManager; [
      inputs.stylix.homeModules.stylix
      inputs.nix-index-database.homeModules.nix-index
      machine-laptop
      options
      user-ascj
      cli
      gui

      ({ config, ... }: {
        # TODO
        home.stateVersion = config.own.machine.initialStateVersion;
        home.username = config.own.user.username;
        home.homeDirectory = "/home/${config.own.user.username}";
      })
    ];
  };
}

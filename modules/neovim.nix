{ inputs, ... }: {
  flake.modules.homeManager.cli = { ... }: {
    home.packages = [
      inputs.nixvim-config.packages."x86_64-linux".neovim-offline
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}

{ inputs, ... }: {
  flake.modules.homeManager.cli = { ... }: {
    home.packages = [
      inputs.nixvim-config.pckages."x86_64-linux".default
    ];
  };
}

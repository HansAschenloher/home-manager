{ ... }:
{
  flake.modules.homeManager.cli = { ... }: {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      extraConfig = ''
        AddKeysToAgent yes
      '';
      settings = {
        "*" = {
          forwardAgent = true;
        };
      };
    };
  };
}

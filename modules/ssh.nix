{ config, lib, ... }:
let
  cfg = config.my.modules.ssh;
in
{
  options.my.modules.ssh = {
    enable = lib.mkEnableOption "My ssh config";
  };
  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      extraConfig = ''
        AddKeysToAgent yes
      '';
      matchBlocks = {
        "*" = {
          forwardAgent = true;
        };
      };
    };
  };
}

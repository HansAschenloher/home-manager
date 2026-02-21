{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.my.modules.bat;
in
{
  options.my.modules.bat = {
    enable = lib.mkEnableOption "My bat config";
  };
  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
    };

    home.activation.buildBatCache = lib.hm.dag.entryAfter [
      "writeBoundary"
    ] "${pkgs.bat}/bin/bat cache --build";
  };
}

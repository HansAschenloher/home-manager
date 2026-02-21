{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.my.modules.launcher;
in
{
  options.my.modules.launcher = {
    enable = lib.mkEnableOption "My launcher (rofi)";
  };
  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      terminal = "alacritty";
      plugins = [ pkgs.rofi-emoji ];
      extraConfig = {
        modi = "drun";
        show-icons = true;
        sort = true;
        matching = "fuzzy";
      };
    };
  };
}

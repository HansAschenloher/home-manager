{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.my.modules.windowManager.xmonad;
in
{
  options.my.modules.windowManager.xmonad = {
    enable = lib.mkEnableOption "My xmonad config";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.i3lock-fancy
    ];
    xsession = {
      enable = true;
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = ./config.hs;
      };
    };

    # XMoBar
    programs.xmobar = {
      enable = true;
      extraConfig = builtins.readFile ./xmobar.hs;
    };
  };
}

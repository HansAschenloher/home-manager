{ pkgs, lib, ... }:
{
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
}

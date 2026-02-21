{ pkgs, ... }:
{
  #TODO: create a screenlocker module
  imports = [
    ../../modules/rofi.nix
    ../../modules/xmonad
    ../../modules/screen-locker.nix
  ];

  home.sessionVariables = {
    TERM = pkgs.alacritty;
  };

  my.modules = {
    windowManager.xmonad.enable = true;
    launcher.enable = true;
    screen-locker.enable = true;
  };

  home.packages = with pkgs; [
    alacritty
    flameshot
    libreoffice
    nautilus
    obsidian
    vivaldi
  ];

  programs = { };
}

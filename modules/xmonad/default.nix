{ pkgs, lib, ... }: {
  home.packages = [ pkgs.firefox pkgs.i3lock-fancy ];
  xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./config.hs;
      extraPackages = haskellPackages: [
        haskellPackages.dbus
        haskellPackages.monad-logger
      ];
    };
  };

  # XMoBar

  programs.xmobar = {
    enable = true;
    extraConfig = builtins.readFile ./xmobar.hs;
  };
}

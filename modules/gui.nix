{ ... }: {
  flake.modules.homeManager.gui = { pkgs, ... }: {
    wayland.windowManager.hyprland.configType = "lua";
    home.packages = with pkgs; [
      alacritty
      flameshot
      libreoffice
      nautilus
      obsidian
      vivaldi
      vial
    ];
  };
}

{
  imports = [
    ../../roles/dev
    ../../roles/graphical
    ../../roles/gaming
  ];

  home.username = "ja";
  home.homeDirectory = "/home/ja";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}

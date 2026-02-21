let
  fullName = "Johann Aschenloher";
  email = "hansi.aschenloher@gmail.com";
in {
  imports = [
    ../../roles/dev
    ../../roles/graphical
    ../../roles/gaming
  ];

  home.username = "ja";
  home.homeDirectory = "/home/ja";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  my.modules.git.user = {
    inherit fullName email;
  };
}

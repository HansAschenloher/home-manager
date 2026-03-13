{lib, ...}:
let
  fullName = "Johann Aschenloher";
  email = "hansi.aschenloher@gmail.com";
in {
  imports = [
    ../../roles/dev
    ../../roles/graphical
    ./niri.nix
    #../../roles/gaming
  ];
  home.username = "ascj";
  home.homeDirectory = "/home/ascj";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  my.modules = {
    git.user = {
      inherit fullName email;
    };
    windowManager.xmonad.enable = lib.mkForce false;
  };
}

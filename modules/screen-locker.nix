{config, lib, pkgs, ...}:
let
  cfg = config.my.modules.screen-locker;
in
  {
    options.my.modules.screen-locker = {enable = lib.mkEnableOption "My screen-locker";};
    config = lib.mkIf cfg.enable {
  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock-fancy-rapid}/bin/i3lock-fancy-rapid 6 5 -n";
  };
};
}

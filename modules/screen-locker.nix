{
  ...
}:
{
  flake.modules.homeManager.gui = { pkgs, ... }: {
    services.screen-locker = {
      enable = false;
      lockCmd = "${pkgs.i3lock-fancy-rapid}/bin/i3lock-fancy-rapid 6 5 -n";
    };
  };
}

{
  ...
}:
{
  flake.modules.homeManager.gui =
    { pkgs, ... }:
    {
      programs.rofi = {
        enable = true;
        terminal = "alacritty"; # TODO make configurable
        plugins = [ pkgs.rofi-emoji ]; # TODO setup correctly
        extraConfig = {
          modi = "drun";
          show-icons = true;
          sort = true;
          matching = "fuzzy";
        };
      };
    };
}

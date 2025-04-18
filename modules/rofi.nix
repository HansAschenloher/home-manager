{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    plugins = [ pkgs.rofi-emoji ];
    extraConfig = {
      modi = "drun";
      show-icons = true;
      sort = true;
      matching = "fuzzy";
    };
  };
}

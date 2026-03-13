{
  config,
  ...
}: {
  programs.niri = {
    enable = true;
      settings = {
      input = {
        mod-key = "Super";
      };

      binds = with config.lib.niri.actions; {
        "Mod+Return".action = spawn "alacritty";
      };
    };
  };
}

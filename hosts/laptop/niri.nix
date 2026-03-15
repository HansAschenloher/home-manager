{
  pkgs,
  config,
  ...
}: {
  programs.niri = {
    enable = true;
      settings = {
      input = {
        mod-key = "Super";
          keyboard = {
            xkb = {
              model = "pc104";
              layout = "de";
              #options "grp:win_space_toggle"
            };
          };
      };

      outputs."eDP-1" = {
        scale = 1.0;
      };

      layout = {
        gaps = 1;
        #preset-column-widths = config.lib.niri.proportion [0.5];
        #default-column-width = {
          #proportion = 1;
        #};
      };

      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      environment = {
        QT_QPA_PLATFORM = "wayland";
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        DISPLAY = null;
        _JAVA_AWT_WM_NONREPARENTING="1";
        GTK_IM_MODULE="simple";
      };

      hotkey-overlay = {
        skip-at-startup = true;
        hide-not-bound = true;
      };

      binds = with config.lib.niri.actions; {
        "Mod+Return".action = spawn "alacritty";
        "Mod+P".action = spawn "rofi" "-show" "drun";
        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;

        #"Mod+Shift+1".action = move-window-to-workspace "1";
        #"Mod+Shift+2".action = move-window-to-workspace "2";
        #"Mod+Shift+3".action = move-window-to-workspace "3";
        #"Mod+Shift+4".action = move-window-to-workspace "4";
        #"Mod+Shift+5".action = move-window-to-workspace "5";
        #"Mod+Shift+6".action = move-window-to-workspace "6";
        #"Mod+Shift+7".action = move-window-to-workspace "7";
        #"Mod+Shift+8".action = move-window-to-workspace "8";
        #"Mod+Shift+9".action = move-window-to-workspace "9";


        # Focus movment
        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        #"Mod+J".action = focus-column-down;
        #"Mod+K".action = focus-column-up;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;

        # Move windows
        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+J".action = move-window-down;
        "Mod+Shift+K".action = move-window-up;

        #Move Colum
        "Mod+W".action = close-window;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+F".action = maximize-column;

        "Mod+Shift+Space".action = toggle-window-floating;
        "Mod+Ctrl+Space".action = center-window;

        #Resize columns
        "Mod+Ctrl+H".action = set-column-width "-10%";
        "Mod+Ctrl+L".action = set-column-width "+10%";
        "Mod+Ctrl+J".action = set-window-height "+10%";
        "Mod+Ctrl+K".action = set-window-height "-10%";
      };
    };
  };

  home.packages = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gnome-keyring
  ];
}

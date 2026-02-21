{config, lib, pkgs, ...}:
let
  cfg = config.my.modules.xrdp;
in
  { options.my.modules.xrdp = { enable = lib.mkEnableOption "My xrdp config";}; config = lib.mkIf cfg.enable {
    # TODO Move to NixOs config
    home.file."startwm.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        #set -eu
        echo "### Starting Xrdp Session" | systemd-cat -p info

        # Setup graphical-session.target in case of Xrdp
        systemctl --user set-environment DISPLAY="$DISPLAY"
        systemctl --user set-environment XDG_SESSION_ID="$XDG_SESSION_ID"
        # systemctl --user start graphical-session.target
        if [ -x ~/.xsession ]; then
          exec ~/.xsession
        else
          echo "Starting XMonad" | systemd-cat -p info
          exec ${pkgs.xmonad-with-packages}/bin/xmonad
        fi

        setxkbmap de
      '';
    };
  };}

{
  pkgs,
  user,
  ...
}:
{
  home = {
    stateVersion = "25.05";
    username = user.id;
    homeDirectory = "/home/${user.id}";
    sessionVariables = {
      TERM = "alacritty";
      SHELL = "zsh";
    };

    packages = with pkgs; [
      alacritty
      bubblewrap
      fd
      fd
      file
      flameshot
      gcc
      hexyl
      httpie
      jq
      libreoffice
      nautilus
      nerd-fonts._0xproto
      nerd-fonts.hack
      nerd-fonts.monaspace
      nix-diff
      nix-du
      nixfmt-rfc-style
      nix-prefetch-scripts
      nix-top
      nix-tree
      obsidian
      ripgrep
      unzip
      vivaldi
      wget
      xclip
      zig
    ];

    file."startwm.sh" = {
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
  };

  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock-fancy-rapid}/bin/i3lock-fancy-rapid 6 5 -n";
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    eza.enable = true;
    home-manager.enable = true;
    htop.enable = true;
    starship.enable = false;
    tealdeer.enable = true;
    keychain = {
      enable = true;
      keys = [ "id_ed25519" ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs.zoxide;
    };
  };

  fonts.fontconfig.enable = true;
}

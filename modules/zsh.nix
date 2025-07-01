{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    # Enabled if not ASCIINEMA recording
    # see initExtraBeforeCompInit
    #enableAutosuggestions = true;
    # Add to system: environment.pathsToLink = [ "/share/zsh" ];
    enableCompletion = false;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignorePatterns = [
        "ls"
        "ll"
        "l"
        "fg"
        "bg"
        "lg"
        ".."
        "ps"
        "htop"
        "qalc"
        "inxi"
        "top"
        "lsblk"
        "du"
        "git s"
        "git status"
      ];
      ignoreSpace = true;
      share = false;
      size = 50000;
      save = 50000;
    };

    initContent = ''
      if [ -z "''${ASCIINEMA_REC}" ]; then
        source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      fi
      ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(run-less)


      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      setopt hist_verify

      # filetypes
      alias -s {md,yaml,xml,dot,plantuml,ditaa,txt,json,nix}=$EDITOR
      alias -s {html,xhtml}=$BROWSER
      alias -s {pdf}=zathura

      # This speeds up pasting w/ autosuggest
      # https://github.com/zsh-users/zsh-autosuggestions/issues/238
      pasteinit() {
        OLD_SELF_INSERT=''${''${(s.:.)widgets[self-insert]}[2,3]}
        zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
      }

      pastefinish() {
        zle -N self-insert $OLD_SELF_INSERT
      }
      zstyle :bracketed-paste-magic paste-init pasteinit
      zstyle :bracketed-paste-magic paste-finish pastefinish

      # git
      git-root() {
        realpath --relative-to="$(pwd)" "$(git rev-parse --show-toplevel)" || echo "."
      }

      # file preview at cursor
      run-less() {
        local left=''${LBUFFER/* /}
        local right=''${RBUFFER/ */}
        zle push-input
        BUFFER=" $PAGER --paging=always \"$left$right\""
        zle accept-line;
      }
      zle -N run-less

      update-homemanager() {
        pathToHomeManager="/home/$USER/src/home-manager"
        if [ ! -d "$pathToHomeManager" ]
        then
          echo "No Home Manager found under $pathToHomeManager"
          return -1
        fi
        nix flake update $pathToHomeManager && home-manager switch --flake $pathToHomeManager
      }

      # nix helper
      find-nix-attr() {
        setopt extendedglob
        groot=$(realpath $(git-root))
        adirs=( (../)#default.nix(.od:h:a) )
        # old attr path, used for nix-build
        #dir=''${adirs[1]#"$groot"}
        #echo ''${dir[-2,-1]//\//.}
        basename "$adirs"
      }
      fill-nix-build() {
        LBUFFER="nix build $(git-root)\#$(find-nix-attr)"
      }
      zle -N fill-nix-build

      # bindkeys
      bindkey '^[h' backward-word
      bindkey '^[j' down-history
      bindkey '^[k' up-history
      bindkey '^[l' forward-word

      bindkey '^v' edit-command-line

      bindkey "^[l" run-less

      bindkey "^[b" fill-nix-build
      if [ -z "$(setxkbmap -print | grep mac)" ]; then
        setxkbmap -option eurosign:e,caps:escape,numpad:mac
      fi

      clear() {printf "\ec\e[3J"; zle redisplay}
      zle -N clear
      bindkey "^[n" clear
    '';

    oh-my-zsh = {
      enable = true;
      extraConfig = ''
        DISABLE_AUTO_UPDATE="true"
        DISABLE_AUTO_TITLE="true"
        COMPLETION_WAITING_DOTS="true"
        DISABLE_UNTRACKED_FILES_DIRTY="true"
      '';
      plugins = [
        "git"
        "globalias"
        "colored-man-pages"
      ];
      theme = "";
    };

    sessionVariables = {
      EDITOR = "nvim";
      PAGER = "bat";
      BROWSER = "google-chrome-stable";
    };

    shellAliases = {
      lg = "git status";
      gcom = "git checkout master";
      cg = "cd $(git-root)";

      his = "fc -lED";

      o = "xdg-open";
      e = "$EDITOR";

      ns = "nix shell";
      nd = "nix develop";
      nb = "nix build";

      n = "nvim";
      vi = "nvim";
      vim = "nvim";

      uh = "update-homemanager";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      #typos
      "cd.." = "cd ..";

      # command redefines
      ls = "exa --git";
      cat = "bat";

      rr = "find . -type l -name 'result' -exec rm {} \\;";
    };

    shellGlobalAliases = {
      G = "$(git-root)";
      UUID = "$(uuidgen)";
    };
  };
}

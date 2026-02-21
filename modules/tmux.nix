{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.my.modules.tmux;
in
{
  options.my.modules.tmux = {
    enable = lib.mkEnableOption "My tmux config";
  };
  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      prefix = "C-b";
      newSession = true;
      mouse = true;
      shell = lib.mkForce "${pkgs.zsh}/bin/zsh";
      sensibleOnTop = true;
      extraConfig = ''
        set -g base-index 1
        setw -g pane-base-index 1
        bind-key -T copy-mode-vi v send -X begin-selection
        bind-key -T copy-mode-vi C-v send -X rectangle-toggle
      '';
      plugins = with pkgs; [
        tmuxPlugins.cpu
        tmuxPlugins.yank
        tmuxPlugins.copycat
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.mode-indicator
        tmuxPlugins.urlview
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
          '';
        }
      ];
    };
  };
}

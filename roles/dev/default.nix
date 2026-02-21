{ pkgs, ... }:

{
  imports = [
    ../../modules/bat.nix
    ../../modules/git.nix
    ../../modules/neovim
    ../../modules/ssh.nix
    ../../modules/stylix.nix
    ../../modules/tmux.nix
    ../../modules/zsh.nix
  ];

  home.sessionVariables = {
    SHELL = "zsh";
  };

  my.modules = {
    bat.enable = true;
    git.enable = true;
    neovim.enable = true;
    ssh.enable = true;
    stylix.enable = true;
    tmux.enable = true;
    zsh.enable = true;
  };

  home.packages = with pkgs; [
    bubblewrap
    fd
    file
    gcc
    hexyl
    httpie
    jq
    #nix-diff
    #nix-du
    #nixfmt-rfc-style
    #nix-prefetch-scripts
    #nix-top
    #nix-tree
    ripgrep
    tig
    unzip
    wget
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
    eza.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    htop.enable = true;
    nix-index-database.comma.enable = true;
    tealdeer.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

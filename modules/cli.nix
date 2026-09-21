{ inputs, ... }: {
  flake.modules.homeManager.cli = { pkgs, ... }: {

    imports = [
      inputs.stylix.homeModules.stylix
      inputs.nix-index-database.homeModules.default
    ];

    home.packages = with pkgs; [
      bubblewrap
      fd
      file
      gcc
      hexyl
      httpie
      jq
      ripgrep
      shellcheck
      tasksh
      taskwarrior3
      taskwarrior-tui
      timewarrior
      tig
      unzip
      up
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
  };
}

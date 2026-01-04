{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        incremental_selection.enable = true;
        nixvimInjections = true;
        auto_install = true;
        ensure_installed = [
          "git_config"
          "git_rebase"
          "gitattributes"
          "gitcommit"
          "gitignore"
        ];
      };
    };
    treesitter-textobjects.enable = true;
    treesitter-refactor = {
      enable = true;
      settings.highlightDefinitions.enable = true;
      settings.highlightCurrentScope.enable = false;
      settings.smartRename.enable = true;
      settings.smartRename.keymaps.smartRename = "grr";
      settings.navigation.keymaps = {
        gotoDefinition = "<leader>gd";
        listDefinitions = "<leader>ld";
        listDefinitionsToc = "<leader>lD";
        gotoNextUsage = "<leader>gn";
        gotoPreviousUsage = "<leader>gp";
      };
    };
  };
}

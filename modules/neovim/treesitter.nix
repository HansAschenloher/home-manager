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
      highlightDefinitions.enable = true;
      highlightCurrentScope.enable = false;
      smartRename.enable = true;
      smartRename.keymaps.smartRename = "grr";
      navigation.keymaps = {
        gotoDefinition = "<leader>gd";
        listDefinitions = "<leader>ld";
        listDefinitionsToc = "<leader>lD";
        gotoNextUsage = "<leader>gn";
        gotoPreviousUsage = "<leader>gp";
      };
    };
  };
}

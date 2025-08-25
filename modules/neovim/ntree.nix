{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      modified.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>t";
        action = "<Cmd>NvimTreeFindFileToggle<CR>";
      }
    ];
  };
}

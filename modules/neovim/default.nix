{ pkgs, lib, ... }:
{

  imports = [
    ./cmp.nix
    ./conform.nix
    ./dap.nix
    ./lsp.nix
    ./neoclip.nix
    ./ntree.nix
    ./telescope.nix
    ./treesitter.nix
    ./undotree.nix
  ];

  programs.nixvim = {
    enable = true;
    opts = {
      background = "light";
      colorcolumn = "80";
      completeopt = "menu,menuone,noselect";
      copyindent = true;
      cursorlineopt = "number";
      cursorline = true;
      expandtab = true;
      foldlevelstart = 99;
      foldmethod = "indent";
      hidden = true;
      hlsearch = true;
      ignorecase = true;
      incsearch = true;
      linebreak = true;
      listchars = "tab:▸ ,trail:␣,nbsp:~,extends:…";
      list = true;
      magic = true;
      mouse = "nv";
      number = true;
      preserveindent = true;
      relativenumber = true;
      scrolloff = 2;
      shiftwidth = 2;
      showmatch = true;
      sidescrolloff = 3;
      signcolumn = "yes";
      smartcase = true;
      smarttab = true;
      softtabstop = 2;
      splitbelow = true;
      splitright = true;
      tabstop = 2;
      termguicolors = true;
      undofile = true;
      updatetime = lib.mkForce 300;
      visualbell = true;
      winwidth = 80;
    };

    globals = {
      mapleader = " ";
    };

    #  colorschemes.dracula.enable = true;

    keymaps = [
      {
        mode = "n";
        key = "<leader>qn";
        action = "<cmd>cnext<CR>";
        options.desc = "Quickfix Next";
      }
      {
        mode = "n";
        key = "<leader>qp";
        action = "<cmd>cprevious<CR>";
        options.desc = "Quickfix Previous";
      }
    ];

    plugins = {
      gitgutter.enable = true;
      lualine.enable = true;
      markdown-preview.enable = true;
      refactoring.enableTelescope = true;
      refactoring.enable = true;
      tmux-navigator.enable = true;
      todo-comments.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      git-blame-nvim
      nerdcommenter
      nvim-dap-ui
      vim-devicons
      vim-nix
    ];
  };
}

{pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          cssls.enable = true;
          dockerls.enable = true;
          gleam.enable = true;
          gleam.package = pkgs.gleam;
          html.enable = true;
          hls = {
            enable = true;
            installGhc = true;
          };
          ltex.enable = true;
          lua_ls.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          ts_ls = {
            enable = true;
            settings = {
              preferences = {
                disableSuggestions = true;
                includeInlayParameterNameHints = true;
                includeInlayFunctionLikeReturnTypeHints = true;
              };
              filetypes = [
                "ts"
              ];
            };
          };
          eslint.enable = true;
          golangci_lint_ls.enable = true;
          vue_ls.enable = true;
          yamlls.enable = true;
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };

        keymaps = {
          lspBuf = {
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
          };
          extra = [
            {
              key = "K";
              action = "<CMD>Lspsaga hover_doc<Enter>";
            }
          ];
        };
      };

      none-ls.enable = true;
      lsp-format.enable = true;
      lsp-lines.enable = true;
      lspkind.enable = true;
      lspsaga = {
        enable = true;
        settings.ui.devicon = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>lc";
        action = "<Cmd>Lspsaga code_action<CR>";
        options.desc = "Code Actions";
      }
      {
        mode = "n";
        key = "<leader>li";
        action = "<Cmd>Lspsaga incoming_calls<CR>";
        options.desc = "Incoming Calls";
      }
      {
        mode = "n";
        key = "<leader>lk";
        action = "<Cmd>Lspsaga diagnostic_jump_next<CR>";
        options.desc = "Diagnistics jump next";
      }
      {
        mode = "n";
        key = "<leader>lj";
        action = "<Cmd>Lspsaga diagnostic_jump_prev<CR>";
        options.desc = "Diagnistics jump next";
      }
      {
        mode = "n";
        key = "<leader>lo";
        action = "<Cmd>Lspsaga outline<CR>";
        options.desc = "Outline";
      }
    ];
  };
}

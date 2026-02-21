{
  config,
  lib,
  ...
}:
let
  cfg = config.my.modules.git;
in
{
  options.my.modules.git = {
    enable = lib.mkEnableOption "My git config";
    user = {
      fullName = lib.mkOption {
        default = "Johann Aschenloher";
        description = "Your full name, that gets displayed in the commit message";
      };
      email = lib.mkOption {
        default = "hansi.aschenloher@gmail.com";
        description = "Your email, that gets displayed in the commit message";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = cfg.user.fullName;
          email = cfg.user.email;
        };

        alias = {
          co = "checkout";
          s = "status";
          a = "add";
          ai = "add -i";
          r = "rebase -i";
        };
      };

      ignores = [ "*.swp" ];
      includes = [ { path = "~/.gitconfig"; } ];
      lfs.enable = true;
    };
    programs.delta = {
      enable = true;
      options = {
        features = "line-numbers decorations";
        whitespace-error-style = "22 reverse";
        side-by-side = true;
        line-numbers = true;
        syntax-theme = "Dracula";
        navigate = true;
        plus-style = "syntax #003800";
        minus-style = "syntax #3f0001";
        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-style = "bold yellow ul";
          file-decoration-style = "none";
          hunk-header-style = "cyan";
          hunk-header-file-style = "cyan";
          hunk-header-decoration-style = "cyan box ul";
          line-numbers-left-style = "cyan";
          line-numbers-right-style = "cyan";
          line-numbers-minus-style = 124;
          line-numbers-plus-style = 28;
        };
      };

    };
  };
}

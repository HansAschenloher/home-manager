{ user, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = user.fullName;
        email = user.mail;
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
}

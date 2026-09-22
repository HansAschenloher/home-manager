{
  ...
}:
{
  flake.modules.homeManager.cli =
    {
      pkgs,
      config,
      ...
    }:
    {
      programs.git = {
        enable = true;
        settings = {
          user = {
            name = config.own.user.fullName;
            email = config.own.user.email;
          };

          alias = {
            co = "checkout";
            s = "status";
            a = "add";
            ai = "add -i";
            r = "rebase -i";
            cc = "shortlog -sn --no-merges"; # Comit Count of authors
            topfiles = "!f() { git log --name-only --pretty=format: \"$@\" | ${pkgs.ripgrep}/bin/rg -v '^$' | sort | uniq -c | sort -nr | head -20; }; f";
          };
        };

        ignores = [
          "*.swp"
          "result/*"
        ];
        includes = [ { path = "~/.gitconfig"; } ];
        lfs.enable = true;

        package = pkgs.gitFull.override { withLibsecret = true; };
        settings.credential.helper = "libsecret";
      };

      services.gnome-keyring.enable = true;
    };
}

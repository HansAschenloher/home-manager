{ inputs, lib, ... }:
let
  inherit (lib) mkOption;
  inherit (lib.types)
    submodule
    str
    strMatching
    ;
  email = strMatching ''^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$''; # Very basic and not RFC822 nor RFC 5322 complient

  userType = submodule {
    config._module.check = true;
    options = {
      username = mkOption { type = str; };
      fullName = mkOption { type = str; };
      email = mkOption { type = email; };
      #ssh.keys = mkOption { type = str; };
    };
  };
in
{
  flake.modules.homeManager.options = { ... }: {
    options.own.user = mkOption {
      type = userType;
    };
  };
  flake.modules.homeManager.user-ascj = { ... }: {
    own.user = {
      username = "ascj";
      fullName = "Johann Aschenloher";
      email = "hansi.aschenloher@gmail.com";
    };
  };
}

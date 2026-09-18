{ lib, ... }:
let
  inherit (lib) mkOption;
  inherit (lib.types)
    str
    lazyAttrsOf
    submodule
    anything
    ;
  Machine = submodule {
    config._module.freeformType = anything; # TODO
  };
in
{
  flake.modules.homeManager.options = { ... }: {
    options.own.machine = mkOption {
      type = Machine;
    };
  };

  flake.modules.homeManager.machine-laptop = { ... }: {
    own.machine = {
      hostname = "laptop";
      initialStateVersion = "25.05";
    };
  };
}

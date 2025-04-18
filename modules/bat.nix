{pkgs, lib, ...}:
{
  programs.bat = {
    enable = true;
  };

  home.activation.buildBatCache = lib.hm.dag.entryAfter [ "writeBoundary" ]
    "${pkgs.bat}/bin/bat cache --build";
}

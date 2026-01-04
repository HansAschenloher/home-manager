{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    extraConfig = ''
      AddKeysToAgent yes
    '';
    matchBlocks = {
      "*" = {
        forwardAgent = true;
      };
    };
  };
}

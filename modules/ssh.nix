{
  programs.ssh = {
    enable = true;
    forwardAgent = true;
    extraConfig = ''
      AddKeysToAgent yes
    '';
    matchBlocks = {};
  };
}

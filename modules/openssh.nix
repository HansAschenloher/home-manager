{ ... }: {
  #TODO migrate nixos config
  flake.modules.nixos.base = {
    servies.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };
}

{config, lib, ...}:
let
  cfg = config.my.modules.ssh-server;
in
  { options.my.modules.ssh-server = { enable = lib.mkEnableOption "Enable openssh server";};
  config = lib.mkIf cfg.enable {

    servies.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 9922 ];
    };
  };
}

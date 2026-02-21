{ pkgs, ... }:
{
  imports = [
  ];

  home.packages = with pkgs; [
    #discord
    prismlauncher
    #unstable.teamspeak3
  ];
}

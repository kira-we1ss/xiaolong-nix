{ pkgs, ... }:

{
  networking.hostName = "xiaolong-nix";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
}

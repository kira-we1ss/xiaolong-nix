{ pkgs, ... }:

{
  networking.hostName = "xiaolong-nix";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  fileSystems."/mnt/nas-backup" = {
    device = "//192.168.3.226/MyStuff/nixos-config";
    fsType = "cifs";
    options = [
      "credentials=/etc/nixos/nas-credentials"
      "uid=0"
      "gid=0"
      "_netdev"
      "x-systemd.automount"
      "x-systemd.idle-timeout=60"
    ];
  };
}

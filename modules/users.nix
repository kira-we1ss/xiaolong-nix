{ pkgs, ... }:

{
  users.users.kweiss = {
    isNormalUser = true;
    description = "Kira Weiss";
    extraGroups = [
      "wheel"
      "networkmanager"
      "input"
      "video"
      "gamemode"
      "adbusers"
      "docker"
    ];
    shell = pkgs.fish;
  };

  security.sudo.extraRules = [
    {
      users = [ "kweiss" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
  users.groups.libvirtd.members = [ "kweiss" ];
  users.groups.kvm.members = [ "kweiss" ];
}

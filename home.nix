{ pkgs, ... }:

{
  home.username = "kweiss";
  home.homeDirectory = "/home/kweiss";
  home.stateVersion = "26.05";

  # User packages move here from configuration.nix
  home.packages = with pkgs; [
    thunderbird
    qbittorrent
    davinci-resolve
  ];

  # Fish aliases
  programs.fish = {
    enable = true;
    shellAliases = {
      zed = "zeditor";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#xiaolong-nix";
      update = "sudo nix flake update --flake /etc/nixos";
      cleanup = "sudo nix-collect-garbage -d";
    };
    interactiveShellInit = ''
      hyfetch
    '';
  };

  programs.home-manager.enable = true;
}

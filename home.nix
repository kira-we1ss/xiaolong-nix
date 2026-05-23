{ pkgs, helium, ... }:

{
  home.username = "kweiss";
  home.homeDirectory = "/home/kweiss";
  home.stateVersion = "25.11";

  # User packages move here from configuration.nix
  home.packages = with pkgs; [
    thunderbird
    qbittorrent
    signal-desktop
  ];

  # GNOME settings
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

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

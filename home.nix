{ pkgs, lib, ... }:

{
  home.username = "kweiss";
  home.homeDirectory = "/home/kweiss";
  home.stateVersion = "26.05";

  # User packages move here from configuration.nix
  home.packages = with pkgs; [
    thunderbird
    qbittorrent
    davinci-resolve
    swaybg
    rofi
    ghostty
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

  home.sessionVariables = {
    PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";
  };

  home.activation.playwrightBrowsers = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run mkdir -p $HOME/.cache/ms-playwright/chromium-1208/chrome-linux
    run ln -sf ${pkgs.playwright-driver.browsers}/chromium-1217/chrome-linux64/chrome \
      $HOME/.cache/ms-playwright/chromium-1208/chrome-linux/chrome
    run mkdir -p $HOME/.cache/ms-playwright/chromium_headless_shell-1208/chrome-headless-shell-linux64
    run ln -sf ${pkgs.playwright-driver.browsers}/chromium_headless_shell-1217/chrome-headless-shell-linux64/chrome-headless-shell \
      $HOME/.cache/ms-playwright/chromium_headless_shell-1208/chrome-headless-shell-linux64/chrome-headless-shell
  '';

  programs.home-manager.enable = true;
  xdg.configFile."/etc/nixos/niri/config.kdl".source = ./config.kdl;
  programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
  # programs.waybar.enable = true; # launch on startup in the default setting (bar)
  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit
}

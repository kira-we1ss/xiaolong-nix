{ pkgs, ... }:

{
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.throne = {
    enable = true;
    tunMode = {
      enable = true;
    };
  };
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = { };
  programs.alacritty.enable = true; # Super+T in the default setting (terminal)
  programs.fuzzel.enable = true; # Super+D in the default setting (app launcher)
  programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
  programs.waybar.enable = true; # launch on startup in the default setting (bar)
  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit
  programs.niri.enable = true;
  programs.gamemode.enable = true;
  programs.kdeconnect.enable = true;
  programs.helium.enable = true;
  programs.steam.enable = true;
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-all;
  };

  programs.ssh.extraConfig = ''
    IdentityAgent ~/.bitwarden-ssh-agent.sock
  '';
  programs.nix-ld.enable = true;
  #  enable = true;
  #  libraries = with pkgs; [
  #    glib
  #    nss
  #    nspr
  #    atk
  #    cups
  #    dbus
  #    expat
  #    libdrm
  #    libxkbcommon
  #    mesa
  #    pango
  #    cairo
  #    xorg.libX11
  #    xorg.libXcomposite
  #    xorg.libXdamage
  #    xorg.libXext
  #    xorg.libXfixes
  #    xorg.libXrandr
  #    xorg.libxcb
  #    gtk3
  #    alsa-lib
  #    libGL
  #    wayland
  #    libgbm
  #    libdecor
  #  ];
  # };
  virtualisation.libvirtd = {
    enable = true;

    # Enable TPM emulation
    qemu = {
      swtpm.enable = true;
    };
  };

}

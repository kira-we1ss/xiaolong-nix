{ pkgs, ... }:

{
  programs.dconf.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.throne = {
    enable = true;
    tunMode = {
      enable = true;
    };
  };
  programs.gamemode.enable = true;
  programs.adb.enable = true;
  programs.helium.enable = true;
  programs.steam.enable = true;
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-all;
  };

  programs.ssh.extraConfig = ''
    IdentityAgent ~/.bitwarden-ssh-agent.sock
  '';
  #programs.nix-ld = {
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
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
  };

}

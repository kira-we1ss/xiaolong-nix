{ pkgs, ... }:

{
  # Performance
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
  };
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };
  services.tuned.enable = true;
  services.power-profiles-daemon.enable = false;
  services.gnome.gnome-remote-desktop.enable = true;
  virtualisation.docker.enable = true;
  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # System services
  services.fprintd.enable = true;
  services.flatpak.enable = true;
  services.printing.enable = true;
  services.zapret.enable = true;
  services.resolved.enable = true;
  services.netbird.enable = true;
}

{ pkgs, lib, ... }:

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
  security.pam.services.kwallet = {
    enable = true;
  };
  systemd.services.fprintd.serviceConfig.ExecStart =
    lib.mkForce "${pkgs.fprintd}/libexec/fprintd --timeout -1";
  security.pam.services.polkit-1.fprintAuth = true;
  security.pam.services.kde.fprintAuth = pkgs.lib.mkForce true;
  security.pam.services.sudo.fprintAuth = true;
}

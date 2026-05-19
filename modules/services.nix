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

  # NixOS config backup to NAS
  systemd.services.nixos-config-backup = {
    description = "Backup NixOS config to NAS";
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    script = ''
      ${pkgs.rsync}/bin/rsync -av --exclude='nas-credentials' --exclude='hardware-configuration.nix' /etc/nixos/ /mnt/nas-backup/
    '';
  };
  systemd.timers.nixos-config-backup = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
  };
}

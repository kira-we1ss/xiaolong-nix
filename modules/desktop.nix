{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "grp:ctrl_space_toggle";
  };

  services.displayManager.gdm.enable = true;
  services.displayManager.gdm.wayland = true;
  services.displayManager.gdm.settings = {
    daemon = {
      EnableFingerprint = true;
    };
  };
  services.displayManager.defaultSession = "gnome";
  services.desktopManager.gnome.enable = true;
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    WAYLAND_DISPLAY = "wayland-0";
  };
}

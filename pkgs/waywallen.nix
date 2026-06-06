{ lib, appimageTools, fetchurl, nix-update-script }:

let
  version = "0.1.8";
  src = fetchurl {
    url = "https://github.com/waywallen/waywallen/releases/download/v${version}/waywallen-${version}-x86_64.AppImage";
    hash = "sha256-OLEJyXTDyWzyyscU8GpwVRlEzhM3zI52ZZL53Unfoew=";
  };
in
appimageTools.wrapType2 {
  inherit version src;
  pname = "waywallen";

  meta = {
    description = "Dynamic wallpaper manager for Linux (Wayland)";
    homepage = "https://github.com/waywallen/waywallen";
    license = lib.licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "waywallen";
  };

  passthru.updateScript = nix-update-script { };
}

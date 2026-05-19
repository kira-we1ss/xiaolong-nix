{ ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      valkey = prev.valkey.overrideAttrs (_: {
        doCheck = false;
      });
    })
  ];
}

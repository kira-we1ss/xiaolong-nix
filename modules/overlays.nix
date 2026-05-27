{ ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      valkey = prev.valkey.overrideAttrs (_: {
        doCheck = false;
      });

      openldap = prev.openldap.overrideAttrs (_: {
        doCheck = false;
      });
    })
  ];
}

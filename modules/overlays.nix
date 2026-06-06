{ ... }:

{
  nixpkgs.overlays = [
    (_: prev: {
      openldap = prev.openldap.overrideAttrs {
        doCheck = !prev.stdenv.hostPlatform.isi686;
      };
      waywallen = prev.callPackage ../pkgs/waywallen.nix { };
    })
  ];
}

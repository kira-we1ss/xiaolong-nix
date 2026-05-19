{ config, pkgs, lib, ... }:
{
  imports = [ ./module.nix ];
  config = lib.mkIf config.services.zapret.enable {
    services.zapret.package = lib.mkDefault (pkgs.callPackage ./package.nix {
      zapret-src = pkgs.fetchFromGitHub {
        owner = "bol-van";
        repo  = "zapret";
        rev   = "363fbe6943b16b0acd4a0e9dae35fc5075069d0d";
        # Run: nix-prefetch-url --unpack https://github.com/bol-van/zapret/archive/363fbe6943b16b0acd4a0e9dae35fc5075069d0d.tar.gz
        hash  = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      };
    });
  };
}

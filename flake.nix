{
  description = "xiaolong system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    helium = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kopuz = {
      url = "github:temidaradev/kopuz";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-cachyos-kernel,
      helium,
      kopuz,
      ...
    }:
    {
      nixosConfigurations.xiaolong-nix = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit helium;
          inherit kopuz;
        };
        modules = [
          (
            { ... }:
            {
              nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
              nixpkgs.hostPlatform = "x86_64-linux";
            }
          )

          ./hardware-configuration.nix
          helium.nixosModules.default
          ./modules/boot.nix
          ./modules/hardware.nix
          ./modules/networking.nix
          ./modules/locale.nix
          ./modules/desktop.nix
          ./modules/services.nix
          ./modules/programs.nix
          ./modules/globalpackages.nix
          ./modules/users.nix
          ./modules/nix.nix
          ./modules/overlays.nix
          ./modules/hosts.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.kweiss = import ./home.nix;
          }
        ];
      };
    };
}

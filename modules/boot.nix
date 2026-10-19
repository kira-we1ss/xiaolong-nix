{ pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # 2026-10-19: CachyOS kernel removed - xddxdd's infra (incl. attic signing key)
  # compromised, see nix-cachyos-kernel issue #110. Stock nixpkgs kernel instead.
  boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelModules = [ "msr" ];

  # Cross-compilation support
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  nix.settings.extra-platforms = [ "aarch64-linux" ];

  # Kernel sysctl tuning
  boot.kernel.sysctl = {
    "vm.dirty_ratio" = 10;
    "vm.dirty_background_ratio" = 5;
    "kernel.sched_latency_ns" = 1000000;
    "kernel.sched_migration_cost_ns" = 500000;
  };
}

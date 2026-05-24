{ pkgs, ... }:

{
  hardware.opentabletdriver.enable = true;
  hardware.cpu.amd.updateMicrocode = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vulkan-validation-layers
      vulkan-extension-layer
    ];
  };
  # Enable USB redirection
  virtualisation.spiceUSBRedirection.enable = true;
}

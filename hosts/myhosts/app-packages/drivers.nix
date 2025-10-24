{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Graphics
    mesa
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    #amdvlk
    #rocmPackages.clr
    dxvk
    vkd3d
    
    # Diagnostic tools
    glxinfo
    clinfo
    pciutils

    # Input
    libinput

    # Bluetooth tools (if not handled elsewhere)
    bluez-tools
  ];
}

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Diagnostic tools
    glxinfo
    pciutils

    # Input
    libinput

    # Bluetooth tools (if not handled elsewhere)
    bluez-tools
    
    # Graphics
    mesa
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    #amdvlk
    #rocmPackages.clr
    dxvk
    vkd3d
  ];
}

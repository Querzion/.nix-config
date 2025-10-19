{ config, pkgs, ... }:

{
    # Enable X11 with AMD GPU drivers    
    #services.xserver.enable = true;
    #services.xserver.videoDrivers = ["amdgpu"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
        #mesa
        #vulkan-loader
        #vulkan-tools
        #vulkan-validation-layers
        #amdvlk
        #rocmPackages.clr
        #dxvk
        #vkd3d
    ];
  };
}


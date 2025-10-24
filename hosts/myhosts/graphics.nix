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
            #dxvk
            #vkd3d
            
            # AMD OPENCL for DAVINCI RESOLVE
            rocmPackages.clr.icd
            rocmPackages_5.clr
            rocmPackages_5.rocminfo
            rocmPackages_5.rocm-runtime
            
            mesa.opencl
        ];
    };
    
    environment.variables = {
        RUSTICL_ENABLE = "radeonsi";
    };
  
    # This is necessary because many programs hard-code the path to hip
    systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages_5.clr}"
    ];
}


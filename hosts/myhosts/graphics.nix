{ config, pkgs, ... }:

{
    # Enable X11 with AMD GPU drivers    
    #services.xserver.enable = true;
    #services.xserver.videoDrivers = ["amdgpu"];

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
}

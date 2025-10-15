{ config, pkgs, ... }:

{
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        input = {
            General = {
                UserspaceHID = true;
            };
        };
    };

    services.upower.enable = true;
}


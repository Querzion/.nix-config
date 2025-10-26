{ config, pkgs, ... }:

{
    boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;

        plymouth.enable = true;
        plymouth.theme = "bgrt";

        kernelParams = [
            "quiet"
            "splash"
            "video=DP-1:2560x1440@165"
        ];

        #kernelPackages = pkgs.linuxPackages_lts;
        kernelPackages = pkgs.linuxPackages_latest;

        # Needed for some Steam games
        kernel.sysctl = {
            "vm.max_map_count" = 2147483642;
        };
        
        # Load hid_apple kernel module needed for Apple Magic Trackpad support
        #kernelModules = [ "hid_apple" ];
    };
}

{ config, pkgs, ... }:

{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelParams = [
        "quiet"
        "splash"
        "video=DP-1:2560x1440@165"
    ];

    boot.kernelPackages = pkgs.linuxPackages_latest;
}

{ config, pkgs, ... }:

{
    hardware.enableAllFirmware = true;
    hardware.firmware = with pkgs; [
        linux-firmware
    ];
}

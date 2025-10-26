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
    settings = {
      General = {
        MaxConnections = 10;
      };
    };
  };

  services.upower.enable = true;
}


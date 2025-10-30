{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/system/firmware.nix
    ./hardware-configuration.nix
    ./modules/system/nvme-2.nix
    ./modules/keyboard.nix
    ./modules/system/graphics.nix
    ./modules/system/boot.nix
    ./modules/system/bluetooth.nix
    ./modules/system/locale.nix
    ./modules/system/audio.nix
    ./modules/system/de/wayland-cosmic.nix
    ./modules/system/network.nix
    ./modules/system/services.nix
    ./modules/system/users.nix
    ./modules/system/fonts.nix
    #./modules/system/samba-shares.nix
    ./modules/applications.nix
  ];

  # Allow installation of unfree packages globally
  nixpkgs.config.allowUnfree = true;
  
  ####################
  # System Version   #
  ####################
  system.stateVersion = "25.05";
}
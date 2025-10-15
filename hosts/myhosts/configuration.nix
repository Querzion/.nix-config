{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/keyboard.nix
    ./firmware.nix
    ./graphics.nix
    ./boot.nix
    ./bluetooth.nix
    ./locale.nix
    ./desktop.nix
    ./network.nix
    ./services.nix
    ./users.nix
    ./fonts.nix
    #./samba-shares.nix
    ./app-packages.nix
    ./app-configs.nix
  ];

  # Allow installation of unfree packages globally
  nixpkgs.config.allowUnfree = true;
  
  ####################
  # System Version   #
  ####################
  system.stateVersion = "25.05";
}
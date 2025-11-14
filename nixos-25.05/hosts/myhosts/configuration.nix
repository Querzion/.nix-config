{ config, pkgs, inputs, ... }:

{
  imports = [
    ./firmware.nix
    ./hardware-configuration.nix
    ./modules/fix-disk-games-permissions.nix
    ./modules/keyboard.nix
    ./graphics.nix
    ./boot.nix
    ./bluetooth.nix
    ./locale.nix
    ./audio.nix
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
  
  # Fix: increase download buffer size
  #nix.settings.download-buffer-size = 134217728;  # 128 MB 
  #nix.settings.download-buffer-size = 268435456;  # 256 MB (Recommended)
  nix.settings.download-buffer-size = 536870912;  # 512 MB (Fast Internet)

  
  ####################
  # System Version   #
  ####################
  system.stateVersion = "25.05";
}
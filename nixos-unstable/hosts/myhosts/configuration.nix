{ config, pkgs, inputs, ... }:

{
  imports = [
    ./firmware.nix
    ./hardware-configuration.nix
    ./modules/fix-disk-games-permissions.nix
    ./modules/keyboard.nix
    ./modules/library.nix
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
  
  services.gnome.gcr-ssh-agent.enable = false;
  
  ####################
  # System Version   #
  ####################
  system.stateVersion = "25.05";
}
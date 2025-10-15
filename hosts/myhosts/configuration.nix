{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
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
}
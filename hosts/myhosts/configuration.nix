{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configurations.nix
    ./boot.nix
    ./desktop.nix
    ./locale.nix
    ./network.nix
    #./samba-shares.nix
    ./services.nix
    ./users.nix
    ./fonts.nix
    ./app-packages.nix
    ./app-configs.nix
  ];
}
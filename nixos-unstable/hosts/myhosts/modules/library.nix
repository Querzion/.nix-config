# ~/.nix-config/nixos-unstable/modules/library.nix

{ config, pkgs, ... }:

{
  # Allow specific insecure packages in your system
  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];
}

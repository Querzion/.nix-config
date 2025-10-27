{ config, pkgs, ... }:

{
  imports = [
    ./app-packages/communication.nix
    ./app-packages/development.nix
    ./app-packages/drivers.nix
    ./app-packages/editing.nix
    ./app-packages/utilities.nix
    ./app-packages/video.nix
    ./app-packages/security.nix
  ];
}


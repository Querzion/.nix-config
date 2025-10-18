{ config, pkgs, ... }:

{
  imports = [
    ./app-packages/audio.nix
    ./app-packages/communication.nix
    ./app-packages/development.nix
    ./app-packages/drivers.nix
    ./app-packages/editing.nix
    ./app-packages/gaming.nix
    ./app-packages/security.nix
    ./app-packages/utilities.nix
    ./app-packages/video.nix
  ];
}


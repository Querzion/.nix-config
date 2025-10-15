{ config, pkgs, ... }:

let
  audio         = import ./app-packages/audio.nix { inherit pkgs; };
  communication = import ./app-packages/communication.nix { inherit pkgs; };
  development   = import ./app-packages/development.nix { inherit pkgs; };
  drivers       = import ./app-packages/drivers.nix { inherit pkgs; };
  editing       = import ./app-packages/editing.nix { inherit pkgs; };
  gaming        = import ./app-packages/gaming.nix { inherit pkgs; };
  security      = import ./app-packages/security.nix { inherit pkgs; };
  utilities     = import ./app-packages/utilities.nix { inherit pkgs; };
  video         = import ./app-packages/video.nix { inherit pkgs; };
in
{
  environment.systemapp-packages = with pkgs; concatLists [
    audio
    communication
    development
    drivers
    editing
    gaming
    security
    utilities
    video
  ];
}

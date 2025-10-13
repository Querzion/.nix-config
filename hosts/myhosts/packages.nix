{ config, pkgs, ... }:

let
  drivers     = import ./packages/drivers.nix { inherit pkgs; };
  gaming      = import ./packages/gaming.nix { inherit pkgs; };
  editing    = import ./packages/editing.nix { inherit pkgs; };
  audio       = import ./packages/audio.nix { inherit pkgs; };
  video       = import ./packages/video.nix { inherit pkgs; };
  streaming   = import ./packages/streaming.nix { inherit pkgs; };
  security    = import ./packages/security.nix { inherit pkgs; };
  development = import ./packages/development.nix { inherit pkgs; };
  utilities   = import ./packages/utilities.nix { inherit pkgs; };
in
{
  environment.systemPackages = with pkgs; concatLists [
    drivers
    gaming
    editing
    audio
    video
    streaming
    security
    development
    utilities
  ];
}

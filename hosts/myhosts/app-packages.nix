{ config, pkgs, ... }:

let
  audio       = import ./packages/audio.nix { inherit pkgs; };
  development = import ./packages/development.nix { inherit pkgs; };
  drivers     = import ./packages/drivers.nix { inherit pkgs; };
  editing     = import ./packages/editing.nix { inherit pkgs; };
  gaming      = import ./packages/gaming.nix { inherit pkgs; };
  security    = import ./packages/security.nix { inherit pkgs; };
  streaming   = import ./packages/streaming.nix { inherit pkgs; };
  utilities   = import ./packages/utilities.nix { inherit pkgs; };
  video       = import ./packages/video.nix { inherit pkgs; };
in
{
  environment.systemPackages = with pkgs; concatLists [
    audio
    development
    drivers
    editing
    gaming
    security
    streaming
    utilities
    video
  ];
}

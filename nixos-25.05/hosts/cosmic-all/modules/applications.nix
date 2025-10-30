{ config, pkgs, ... }:

{
  imports = [
    # Imports - Packages
    ./applications/communication.nix
    ./applications/development.nix
    ./applications/drivers.nix
    ./applications/editing.nix
    ./applications/utilities.nix
    ./applications/video.nix
    ./applications/security.nix
    
    # Imports - Packages with specific configurations.
    ./applications/configurations/docker.nix
    ./applications/configurations/docker-sql-server.nix
    ./applications/configurations/dotnet.nix
    ./applications/configurations/gaming.nix
    #./applications/configurations/neovim.nix
    ./applications/configurations/obs-studio/obs-studio.nix
    #./applications/configurations/virtualization.nix
    ./applications/configurations/ssh.nix
  ];
}


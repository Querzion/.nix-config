{ config, pkgs, ... }:

{
    imports = [
        ./app-configs/docker.nix
        ./app-configs/docker-sql-server.nix
        ./app-configs/dotnet.nix
        ./app-configs/gaming.nix
        ./app-configs/neovim.nix
        ./app-configs/obs-studio/obs-studio.nix
        #./app-configs/virtualization.nix
        ./app-configs/ssh.nix
    ];
}

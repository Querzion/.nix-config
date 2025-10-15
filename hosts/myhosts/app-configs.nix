{ config, pkgs, ... }:

{
    imports = [
        ./app-configs/obs-studio/obs-studio.nix
        ./app-configs/neovim.nix
        ./app-configs/ssh.nix
        ./app-configs/steam.nix
        ./app-configs/docker.nix
        ./app-configs/docker-sql-server.nix
        ./app-configs/virtualization.nix
        ./app-configs/vscode.nix
        ./app-configs/wine.nix
    ];
}

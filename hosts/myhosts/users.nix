{ config, pkgs, ... }:

{
    users.users.querzion = {
        isNormalUser = true;
        description = "Slisk Lindqvist";
        extraGroups = [ "networkmanager" "wheel" "bluetooth" "input" "lp" "docker" ];
        shell = pkgs.bash;
    };
}

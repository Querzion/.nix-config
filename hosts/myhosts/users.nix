{ config, pkgs, ... }:

{
    # Define a user account for 'querzion' on this system
    users.users.querzion = {
        isNormalUser = true;
        description = "Slisk Lindqvist";
        extraGroups = [ "networkmanager" "wheel" "bluetooth" "input" "lp" "docker" ];
        shell = pkgs.bash;
    };
}

{ config, pkgs, ... }:

{
    imports = [
        #./desktop/cosmic.nix
        #./desktop/gnome.nix
        ./desktop/plasma.nix
        #./desktop/hyprland.nix
    ];
}
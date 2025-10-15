{ config, pkgs, ... }:

{
    imports = [
        ./desktop/wayland-plasma.nix
        
        #./desktop/wayland-cosmic.nix
        #./desktop/wayland-hyprland.nix
        #./desktop/wayland-gnome.nix
        #./desktop/x11-gnome.nix
        #./desktop/x11-plasma.nix
        #./desktop/x11-xfce.nix
        #./desktop/x11-dwm.nix
    ];
}
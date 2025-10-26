{ config, pkgs, ... }:

{
    imports = [
        #./desktops/wayland-plasma.nix
        ./desktops/wayland-cosmic.nix
        #./desktops/wayland-hyprland.nix
        #./desktops/wayland-gnome.nix
        #./desktops/x11-gnome.nix
        #./desktops/x11-plasma.nix
        #./desktops/x11-xfce.nix
        #./desktops/x11-dwm.nix
    ];
}

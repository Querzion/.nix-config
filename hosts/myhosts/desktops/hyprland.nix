{ config, pkgs, ... }:

{
    # Enable Hyprland (Wayland)
    services.xserver.enable = true;
    services.xserver.windowManager.hyprland.enable = true;

    # Optional compositor & utilities
    services.picom.enable = true;
    environment.systemPackages = with pkgs; [
        alacritty
        waybar
        grim
        slurp
    ];
}

{ config, pkgs, ... }:

{
    services.xserver.enable = false;

    # Enable Hyprland (Wayland WM)
    programs.hyprland.enable = true;

    # Recommended Wayland utilities
    environment.systemPackages = with pkgs; [
        alacritty
        waybar
        grim
        slurp
        wl-clipboard
        wofi   # application launcher
        waypaper
    ];

    # Optional: greeter for graphical login (like greetd)
    services.greetd.enable = true;
    services.greetd.defaultSession = "hyprland";
}

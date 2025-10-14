{ config, pkgs, ... }:

{
    # Enable GNOME Desktop
    services.xserver.enable = true;
    services.desktopManager.gnome.enable = true;
    services.displayManager.gdm.enable = true;

    # Optional: add GNOME packages
    environment.systemPackages = with pkgs; [
        gnome.gnome-tweaks
        gnome.gnome-calculator
        gnome.gnome-system-monitor
    ];
}
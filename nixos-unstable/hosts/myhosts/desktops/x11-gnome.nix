{ config, pkgs, ... }:

{
    # Enable X11
    services.xserver.enable = true;

    # Enable GNOME Desktop
    services.desktopManager.gnome.enable = true;
    services.displayManager.gdm.enable = true;

    # Optional GNOME packages
    environment.systemPackages = with pkgs; [
        gnome.gnome-tweaks
        gnome.gnome-calculator
        gnome.gnome-system-monitor
        gnome.gnome-terminal
        nautilus
    ];
}

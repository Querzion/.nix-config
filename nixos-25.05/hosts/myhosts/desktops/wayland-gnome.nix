{ config, pkgs, ... }:

{
    services.xserver.enable = false;

    # Enable GNOME
    services.desktopManager.gnome.enable = true;
    services.displayManager.gdm.enable = true;  # GDM starts Wayland by default

    # Useful GNOME packages
    environment.systemPackages = with pkgs; [
        gnome.gnome-tweaks
        gnome.gnome-terminal
        gnome.gnome-extensions-app
        gnome.gnome-calculator
        gnome.gnome-system-monitor
    ];
}

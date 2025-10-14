{ config, pkgs, ... }:

{
    # Enable KDE Plasma
    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.desktopManager.plasma5.enable = true;

    # KDE Utilities
    environment.systemPackages = with pkgs; [
        kdeApplications.kate
        kdeApplications.dolphin
        kdeApplications.yakuake
    ];

    # Autostart Yakuake
    environment.etc."xdg/autostart/yakuake.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Exec=yakuake
        Hidden=false
        NoDisplay=false
        X-GNOME-Autostart-enabled=true
        Name=Yakuake
        Comment=Start Yakuake terminal emulator
    '';
}

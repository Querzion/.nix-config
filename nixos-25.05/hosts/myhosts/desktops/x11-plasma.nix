{ config, pkgs, ... }:

{
    # Enable X11
    services.xserver.enable = true;

    # Enable KDE Plasma
    services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm.enable = true;

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
        Name=Yakuake
        Comment=Start Yakuake terminal emulator
        OnlyShowIn=KDE;
    '';
}

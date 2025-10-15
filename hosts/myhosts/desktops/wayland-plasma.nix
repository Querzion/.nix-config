{ config, pkgs, ... }:

{
    # Disable X11 globally
    services.xserver.enable = false;

    # Enable Plasma Wayland session
    services.desktopManager.plasma6.enable = true;
    services.xserver.desktopManager.plasma6.wayland.enable = true;
    services.displayManager.sddm.enable = true;

    # KDE utilities
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

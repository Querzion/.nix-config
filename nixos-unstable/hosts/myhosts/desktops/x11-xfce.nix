{ config, pkgs, ... }:

{
    # Enable X11
    services.xserver.enable = true;

    # Enable XFCE desktop
    services.xserver.desktopManager.xfce.enable = true;

    # Display Manager (lightweight option)
    services.xserver.displayManager.lightdm.enable = true;

    # Optional XFCE packages
    environment.systemPackages = with pkgs; [
        xfce.thunar         # file manager
        xfce.xfce4-terminal # terminal emulator
        xfce.mousepad       # text editor
        xfce.gnome-screensaver # optional screensaver/lock
    ];

    # Autostart example (optional)
    environment.etc."xdg/autostart/pulseaudio.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Exec=pulseaudio --start
        Hidden=false
        NoDisplay=false
        Name=PulseAudio
        Comment=Start PulseAudio sound server
        OnlyShowIn=XFCE;
    '';
}

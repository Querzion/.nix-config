{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.xserver.windowManager.dwm.enable = true;

    # Optional X11 display manager
    services.xserver.displayManager.slim.enable = true;

    # Minimal system packages
    environment.systemPackages = with pkgs; [
        st      # terminal
        dmenu   # launcher
        xterm   # fallback terminal
    ];
}

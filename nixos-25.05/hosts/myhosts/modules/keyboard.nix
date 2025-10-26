{ config, pkgs, ... }:

{
    # Keyboard layout for graphical sessions (X11 / Wayland)
    services.xserver.xkb = {
        layout = "se";
        variant = "dvorak";
    };

    # Console (TTY) keymap
    console.keyMap = "sv-latin1";
}

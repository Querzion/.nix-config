{ config, pkgs, ... }:

{
    # Disable printing service
    services.printing.enable = false;

    # Enable compositor
    services.picom = {
        enable = true;
        backend = "glx";
        fade = true;
    };

    # Set keyboard layout to Swedish Dvorak
    services.xserver.xkb = {
        layout = "se";
        variant = "dvorak";
    };
}

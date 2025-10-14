{ config, pkgs, ... }:

{
    services.pipewire.enable = true;
    services.pipewire.pulse.enable = true;
    services.pipewire.alsa.enable = true;
    services.pipewire.alsa.support32Bit = true;

    services.picom.enable = true;
    services.picom.backend = "glx";
    services.picom.fade = true;

    virtualisation.docker.enable = true;
    virtualisation.docker.enableOnBoot = true;
}

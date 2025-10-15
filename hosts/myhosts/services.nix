{ config, pkgs, ... }:

{
    # Disable printing service
    services.printing.enable = false;

    # Remove sound.enable entirely
    services.pulseaudio.enable = false; # disable legacy PulseAudio

    # Enable PipeWire for audio
    services.pipewire = {
        enable = true;
        pulse.enable = true;       # PipeWire PulseAudio compatibility
        alsa.enable = true;        # ALSA support
        alsa.support32Bit = true;  # 32-bit apps
        jack.enable = true;        # optional
    };

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

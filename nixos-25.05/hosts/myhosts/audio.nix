{ config, pkgs, ... }:

{
  ##############################
  # PipeWire-based Audio Setup
  ##############################

  # Disable legacy PulseAudio
  services.pulseaudio.enable = false;

  # Enable modern PipeWire audio stack
  services.pipewire = {
    enable = true;

    # PulseAudio compatibility (apps think PulseAudio is running)
    pulse.enable = true;

    # ALSA support (for DaVinci Resolve and low-level apps)
    alsa.enable = true;
    alsa.support32Bit = true;

    # Optional: JACK support (useful for pro audio / production)
    jack.enable = true;
  };

  ##############################
  # Installed Audio Applications & Tools
  ##############################
  environment.systemPackages = with pkgs; [
    # Audio Players
    spotify

    # Audio utilities / tools
    qpwgraph          # PipeWire/Audio mixer GUI
    #pavucontrol      # PulseAudio/Audio mixer GUI (optional)
    #alsa-utils       # ALSA utilities like alsamixer (optional)
    #qasmixer         # optional mixer for ALSA
    #ladspaPlugins    # audio effects / plugins
  ];

  ##############################
  # DaVinci Resolve ALSA Configuration (aplay -l)
  ##############################
  environment.sessionVariables = {
    # Force Resolve to use the Arctis Nova 7P (card 3, device 0)
    AUDIODEV = "hw:3,0";
    ALSA_CARD = "A7P";
  };

  ##############################
  # User Access to Audio Devices
  ##############################
  #users.users.querzion.extraGroups = [ "audio" ];
}


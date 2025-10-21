{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Audio Players
    spotify

    # Audio utilities / tools
    qpwgraph          # Pipewire/Audio mixer GUI
    #pavucontrol      # PulseAudio/Audio mixer GUI
    #alsa-utils       # ALSA utilities like alsamixer
    #qasmixer         # optional mixer
    #ladspaPlugins    # audio effects / plugins
  ];
}


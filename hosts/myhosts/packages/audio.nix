{ pkgs, ... }:

with pkgs;

[
  # Audio Players
  spotify

  # Audio utilities / tools
  pavucontrol      # PulseAudio/Audio mixer GUI
  alsa-utils       # ALSA utilities like alsamixer
  qasmixer         # optional mixer
  ladspaPlugins    # audio effects / plugins
]

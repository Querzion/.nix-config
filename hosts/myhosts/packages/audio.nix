{ pkgs, ... }:

[
  # Pipewire & Audio
  pipewire
  pipewire-alsa
  pipewire-pulse
  pipewire-jack
  rtkit            # real-time scheduling for audio
  alsaUtils        # ALSA utilities
  alsaLib          # ALSA library
  pulseaudio       # for compatibility if needed
]

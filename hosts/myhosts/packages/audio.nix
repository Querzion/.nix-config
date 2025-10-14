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

  # Wine audio support
  faudio
  vkd3d            # Vulkan Direct3D bridge (needed for some games/audio in Wine)
]

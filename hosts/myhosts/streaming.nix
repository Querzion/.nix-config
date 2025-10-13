{ pkgs, ... }:
[
  # OBS Studio with plugins
  (pkgs.obs-studio.override {
    plugins = with pkgs.obs-studio-plugins; [
      obs-webkitgtk
      obs-multi-rtmp
      advanced-scene-switcher
      obs-pipewire-audio-capture
      wlrobs
      obs-tuna
      obs-vkcapture
      input-overlay
      obs-backgroundremoval
      obs-vertical-canvas
    ];
  })
]

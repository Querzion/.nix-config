{ pkgs, ... }:

let
  # Pin OBS to 31.0.4
  obsStudioOld = pkgs.obs-studio.overrideAttrs (oldAttrs: {
    version = "31.0.4";
    sha256 = "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"; # replace with actual hash
  });

  # Patched obs-vertical-canvas
  obsVerticalCanvasPatched = pkgs.obs-studio-plugins.obs-vertical-canvas.overrideAttrs (prevAttrs: {
    patches = (prevAttrs.patches or []) ++ [
      ./patches/obs-vertical-canvas.diff
    ];
  });
in
{
  programs.obs-studio = {
    enable = true;
    package = obsStudioOld;
    plugins = with pkgs.obs-studio-plugins; [
      obs-multi-rtmp
      obs-source-switcher
      advanced-scene-switcher
      obs-pipewire-audio-capture
      wlrobs
      obs-tuna
      obs-vkcapture
      input-overlay
      waveform
      obs-vaapi
      droidcam-obs
      #obs-webkitgtk
      #obs-backgroundremoval
      #obs-vintage-filter
      #obs-shaderfilter
      #looking-glass-obs
      # obs-vertical-canvas # Compile errors
      #obsVerticalCanvasPatched
    ];
  };
}


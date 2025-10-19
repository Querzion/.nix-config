{ pkgs, ... }:

{
    programs.obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
        obs-webkitgtk
        obs-multi-rtmp
        obs-source-switcher
        advanced-scene-switcher
        obs-pipewire-audio-capture
        wlrobs
        obs-tuna
        obs-vkcapture
        input-overlay
        #obs-backgroundremoval
        waveform
        #obs-vintage-filter
        #obs-shaderfilter
        obs-vaapi
        #looking-glass-obs
        droidcam-obs
        # obs-vertical-canvas # Compile errors
        (obs-vertical-canvas.overrideAttrs (prevAttrs: {
            patches = (prevAttrs.patches or []) ++ [
              ./patches/obs-vertical-canvas.diff
            ];
        }))
        ];
    };
}

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     # --------------------------
     # Video players
     # --------------------------
     mpv
     vlc                    
     jellyfin-media-player
     mediainfo

     # --------------------------
     # GStreamer framework & plugins
     # --------------------------
     gst_all_1.gstreamer           # core GStreamer library
     gst_all_1.gst-plugins-base    # essential base plugins
     gst_all_1.gst-plugins-good    # good quality plugins
     gst_all_1.gst-plugins-bad     # less stable or experimental plugins
     gst_all_1.gst-plugins-ugly    # plugins with licensing restrictions
     gst_all_1.gst-libav           # FFmpeg-based plugin for extra codecs

     # --------------------------
     # Media processing / conversion
     # --------------------------
     ffmpeg
  ];
}

{ pkgs, ... }:

with pkgs;

[
    lmstudio
    localsend
    appimage-run
    #flatpak
    curl
    wget
    eza
    unzip
    libsecret
    tree
    #btop
    freerdp
]
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    krita
    gimp
    libreoffice
    figma-linux
    inkscape
    #kdenlive
    #audacity
    #shotcut
    #darktable
    #rawtherapee
    #blender
    davinci-resolve

    # CAD package
    #freecad-wayland
    #freecad
    #freecad-qt6
  ];
}

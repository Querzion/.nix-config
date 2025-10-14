{ pkgs, ... }:

[
  # Game launchers
  heroic
  lutris

  # Emulators
  wineWowPackages.stable
  wine64Packages.stable
  protonup-qt
  proton-ge-bin
  winetricks
  dxvk
  vkd3d
  faudio
]

{ pkgs, ... }:

with pkgs;

[
  # Graphics drivers
  rocmPackages.clr
  amdvlk
  vulkan-tools
  vulkan-loader
  vulkan-validation-layers
  mesa
  glxinfo
  pciutils

  # Input / Peripherals
  libinput          # general input devices

  # Bluetooth
  #bluez
  bluez-tools
]

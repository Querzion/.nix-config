{ pkgs, ... }:

[
  # Graphics drivers
  amdvlk
  mesa
  vulkan-tools
  glxinfo
  pciutils

  # Input / Peripherals
  libinput          # general input devices

  # Bluetooth
  bluez
  bluez-tools

  # Firmware: linux-firmware ensures devices like Wi-Fi and GPUs have the latest firmware.
  linux-firmware
]

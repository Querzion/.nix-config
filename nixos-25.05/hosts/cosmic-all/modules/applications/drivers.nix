{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Diagnostic tools
    glxinfo
    clinfo
    pciutils

    # Input
    libinput

    # Bluetooth tools
    bluez-tools
  ];
}

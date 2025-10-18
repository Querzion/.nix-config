{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Diagnostic tools
    glxinfo
    pciutils

    # Input
    libinput

    # Bluetooth tools (if not handled elsewhere)
    bluez-tools
  ];
}

{ config, lib, pkgs, ... }:

{
  # Enable virtualization
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf.enable = true;  # For UEFI VMs
        swtpm.enable = true;  # TPM emulation
      };
    };
  };

  # Packages for VM management
  environment.systemPackages = with pkgs; [
    qemu
    libvirt
    virt-manager  # GUI for VMs
    bridge-utils  # For bridged nets
    iptables  # Firewall rules
  ];

  # User access (for querzion)
  users.users.querzion.extraGroups = [ "libvirtd" "kvm" ];

  # Hardware passthrough (if you have VFIO/IOMMU)
  boot.kernelParams = [ "iommu=pt" ];
  boot.kernelModules = [ "kvm-intel" "vfio-pci" ];  # Or kvm-amd

  # Networking: Bridge for VMs to access LAN
  networking.bridges.vmc-bridge = {
    interfaces = [ "enp0s3" ];  # Replace with your NIC
  };
  # Firewall allow VM traffic
  networking.firewall.allowedTCPPorts = [ 5900 ];  # VNC/SPICE
}

{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "virtio_pci" "usbhid" "sr_mod" "virtio_blk" ];
  boot.kernelModules = [ "kvm-amd" ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f0ee58a6-edb8-4f1d-b594-ba54c9282cb2";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6DA4-B025";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/2e8a49eb-9a86-4834-8a0a-e10955b4e0a7"; }
  ];

  # Samba Shares (credentials in dotfiles repo)
  fileSystems."/home/querzion/Shares/Gaming" = {
    device = "//192.168.0.3/archive.gaming";
    fsType = "cifs";
    options = [
      "credentials=/home/querzion/NixOS-Config/secrets/samba.cred"
      "uid=1000"
      "gid=1000"
      "rw"
    ];
  };

  fileSystems."/home/querzion/Shares/Data" = {
    device = "//192.168.0.3/archive.data";
    fsType = "cifs";
    options = [
      "credentials=/home/querzion/NixOS-Config/secrets/samba.cred"
      "uid=1000"
      "gid=1000"
      "rw"
    ];
  };

  fileSystems."/home/querzion/Shares/OBS-Studio" = {
    device = "//192.168.0.3/archive.obs-studio";
    fsType = "cifs";
    options = [
      "credentials=/home/querzion/NixOS-Config/secrets/samba.cred"
      "uid=1000"
      "gid=1000"
      "rw"
    ];
  };

  fileSystems."/home/querzion/Shares/Other" = {
    device = "//192.168.0.3/archive.other";
    fsType = "cifs";
    options = [
      "credentials=/home/querzion/NixOS-Config/secrets/samba.cred"
      "uid=1000"
      "gid=1000"
      "rw"
    ];
  };

  fileSystems."/home/querzion/Shares/Work" = {
    device = "//192.168.0.3/archive.work";
    fsType = "cifs";
    options = [
      "credentials=/home/querzion/NixOS-Config/secrets/samba.cred"
      "uid=1000"
      "gid=1000"
      "rw"
    ];
  };

  fileSystems."/home/querzion/Shares/Querzion" = {
    device = "//192.168.0.3/user.querzion";
    fsType = "cifs";
    options = [
      "credentials=/home/querzion/NixOS-Config/secrets/samba.cred"
      "uid=1000"
      "gid=1000"
      "rw"
    ];
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

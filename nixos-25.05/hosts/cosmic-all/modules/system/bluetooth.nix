#{ config, pkgs, ... }:

#{
#  hardware.bluetooth = {
#    enable = true;
#    powerOnBoot = true;
#    input = {
#      General = {
#        UserspaceHID = true;
#      };
#    };
#    settings = {
#      General = {
#        MaxConnections = 10;
#      };
#    };
#  };

#  services.upower.enable = true;
#}

{ config, pkgs, ... }:

{
  ##########################
  # Bluetooth Core Setup
  ##########################
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    input = {
      General = {
        UserspaceHID = true;   # Required for BLE HID devices like Magic Trackpad 2
      };
    };
    settings = {
      PowerManagement = {
        Enable = false;         # Prevent Bluetooth from going to sleep
      };
    };
  };

  ##########################
  # Kernel Modules for Magic Trackpad 2
  ##########################
  boot.kernelModules = [ "hid_apple" "hid_multitouch" ]; # Apple gestures + multitouch support

  ##########################
  # Upower Service
  ##########################
  services.upower.enable = true;

  ##########################
  # Udev Rules to prevent USB suspend (if using a USB-BT dongle)
  ##########################
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="on"
  '';

  ##########################
  # Auto-restart Bluetooth service if it stops
  ##########################
  systemd.services."bluetooth-auto-restart" = {
    description = "Restart Bluetooth if it stops working";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.bash}/bin/bash -c '
          if ! ${pkgs.bluez}/bin/bluetoothctl show | grep -q "Powered: yes"; then
            echo "Bluetooth is down, restarting..."
            systemctl restart bluetooth.service
          fi
        '
      '';
    };
  };

  systemd.timers."bluetooth-auto-restart" = {
    description = "Check Bluetooth health";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "30s";
      OnUnitActiveSec = "30s";
      Persistent = true;
    };
  };
}


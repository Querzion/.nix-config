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
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    input = {
      General = {
        UserspaceHID = true;
      };
    };
  };

  services.upower.enable = true;

  # Minimal auto-restart service
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

  # Timer to check every 30 seconds
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

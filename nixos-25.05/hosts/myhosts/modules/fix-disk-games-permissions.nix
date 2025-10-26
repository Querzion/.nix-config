{ config, lib, pkgs, ... }:

{
    systemd.services.fix-games-permissions = {
        description = "Fix ownership and permissions for /home/querzion/Games";
        after = [ "home-querzion-Games.mount" ];
        requires = [ "home-querzion-Games.mount" ];
        wantedBy = [ "multi-user.target" ];
        
        serviceConfig = {
            Type = "oneshot";
            ExecStart = ''
            /bin/sh -c 'if [ -d /home/querzion/Games ]; then
                /run/current-system/sw/bin/chown -R root:users /home/querzion/Games &&
                /run/current-system/sw/bin/chmod -R ug+rwX /home/querzion/Games &&
                /run/current-system/sw/bin/chmod g+s /home/querzion/Games
            fi'
            '';
        };
    };

}


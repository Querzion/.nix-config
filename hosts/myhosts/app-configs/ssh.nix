{ config, pkgs, ... }:

{
    programs.ssh.startAgent = true;

    services.openssh = {
        enable = false;
        settings.PermitRootLogin = false;
        settings.PasswordAuthentication = false;
        ports = [22];
    };
}

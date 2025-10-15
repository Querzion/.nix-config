{ config, pkgs, ... }:

{
    programs.ssh.startAgent = false;

    services.openssh = {
        enable = false;
        settings.PermitRootLogin = false;
        settings.PasswordAuthentication = false;
        ports = [22];
    };
}

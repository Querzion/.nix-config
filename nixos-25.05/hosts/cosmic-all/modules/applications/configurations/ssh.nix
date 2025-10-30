{ config, pkgs, ... }:

{
    programs.ssh = {
        startAgent = true;
    
        extraConfig = ''
            Host github.com
                User git
                IdentityFile ~/.ssh/id_rsa
                IdentitiesOnly yes
        '';
    };

    services.openssh = {
        enable = false;
        settings.PermitRootLogin = false;
        settings.PasswordAuthentication = false;
        ports = [22];
    };
}

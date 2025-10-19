{ config, pkgs, ... }:

{
    services.xserver.enable = false;

    # Enable Cosmic Desktop
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;
    
    # Possibly also enable the secret service / keyring integration
    #security.pam.services.cosmic-greeter.enableGnomeKeyring = true;

    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
    services.geoclue2.enable = true;

    environment.systemPackages = with pkgs; [
        libsecret
    ];
}

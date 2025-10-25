{ config, pkgs, ... }:

{
    # Disable X11 Server
    services.xserver.enable = false;
    
    # Enable COSMIC Desktop
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;
    
    # Session variables
    environment.sessionVariables = {
        COSMIC_DATA_CONTROL_ENABLED = 1;
        XDG_SESSION_TYPE = "wayland";
    };

    # Session variables for COSMIC
    #environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

    # Possibly also enable the secret service / keyring integration (CRASHES INIT ATM!)
    #security.pam.services.cosmic-greeter.enableGnomeKeyring = true;    
    
    # Enable geolocation service
    services.geoclue2.enable = true;
    
    # Install keyring libraries and gnome-keyring binary
    environment.systemPackages = with pkgs; [
        ####################
        # Security / Key Management
        ####################
        libsecret   # password/key storage
    ];
}


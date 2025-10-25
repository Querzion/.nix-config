{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.xserver.xwayland.enable = true;
    
    # Enable COSMIC Desktop
    services.desktopManager.cosmic.enable = true;
    services.displayManager.cosmic-greeter.enable = true;
    
    # Set session variables for the display manager
    services.xserver.displayManager.sessionVariables = {
        XDG_SESSION_TYPE = "wayland";
    };
      
    # Possibly also enable the secret service / keyring integration (CRASHES INIT ATM!)
    #security.pam.services.cosmic-greeter.enableGnomeKeyring = true;
    
    # Session variables for COSMIC
    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
    
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


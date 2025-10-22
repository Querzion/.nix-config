#{ config, pkgs, ... }:

#{
#    services.xserver.enable = false;

    # Enable Cosmic Desktop
#   services.desktopManager.cosmic.enable = true;
#   services.displayManager.cosmic-greeter.enable = true;
    
    # Possibly also enable the secret service / keyring integration
    #security.pam.services.cosmic-greeter.enableGnomeKeyring = true;

#    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
#    services.geoclue2.enable = true;

#    environment.systemPackages = with pkgs; [
#        libsecret
#    ];
#}

{ config, pkgs, ... }:

{
  services.xserver.enable = false;

  # Enable COSMIC Desktop
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  
  # Possibly also enable the secret service / keyring integration (CRASHES INIT ATM!)
  #security.pam.services.cosmic-greeter.enableGnomeKeyring = true;

  # Session variables for COSMIC
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;

  # Enable geolocation service
  services.geoclue2.enable = true;

  # Install keyring libraries and gnome-keyring binary
  environment.systemPackages = with pkgs; [
    libsecret
    gnome-keyring
  ];

  # Add a systemd user service for gnome-keyring
  systemd.user.services.gnome-keyring = {
    description = "GNOME Keyring Daemon";
    serviceConfig = {
        ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --foreground --components=secrets,ssh,gpg";
        Environment = [
        "SSH_AUTH_SOCK=%t/keyring/ssh"
        "GPG_AGENT_INFO=%t/keyring/gpg"
        ];
        Restart = "on-failure";
    };
    wantedBy = [ "default.target" ];
    };
}


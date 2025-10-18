{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Security Tools
    #yubikey-manager-qt

    # Password Managers
    keepassxc

    # Network Security Tools
    #nmap
    #wireshark

    # Encryption Tools
    #gnupg

    # Firewall Tools
    #ufw
    #firewalld

    # Misc Security Tools
    #clamav
    #rkhunter
    #chkrootkit
  ];

  # Enable RTKit (Real-time permissions manager)
  security.rtkit.enable = true;
}


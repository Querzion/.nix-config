{ pkgs, ... }:

with pkgs;

[
    # Security Tools
    yubikey-manager-qt
    
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

    security.rtkit.enable = true;
]
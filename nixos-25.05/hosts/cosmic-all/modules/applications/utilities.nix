{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    ####################
    # Development / CLI Utilities
    ####################
    curl        # download content from URLs
    wget        # download content from URLs
    eza         # modern ls replacement
    unzip       # extract zip archives
    tree        # display directory structure
    nnn         # terminal file manager
    inxi        # system information

    ####################
    # App / Package Runners
    ####################
    lmstudio     # music / audio production
    localsend    # local file sharing
    appimage-run # run AppImages

    ####################
    # System / Hardware Management
    ####################
    freerdp     # RDP client
    gparted     # partition manager
    udisks2     # disk management daemon
    polkit      # policy kit for privilege management

    ####################
    # Misc / Utilities
    ####################
    yazi        # notepad/text editor
  ];
}


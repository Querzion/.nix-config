{ config, pkgs, ... }:

{
    ####################
    # Wine Packages    #
    ####################
    environment.systemPackages = with pkgs; [
        #wineWowPackages.stable  # 32-bit support
        wine64Packages.stable
        winetricks               # handy helper scripts

        # Wine audio support
        faudio
    ];

    ####################
    # Optional Env Vars #
    ####################
    environment.sessionVariables = {
        WINEPREFIX = "$HOME/.wine";
        WINEARCH = "win64";  # default architecture for new prefixes
    };
}

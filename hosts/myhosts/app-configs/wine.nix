{ config, pkgs, ... }:

{
    ####################
    # Wine Packages    #
    ####################
    environment.systemPackages = with pkgs; [
        wine64Packages.stable
        wineWowPackages.stable  # 32-bit support
        winetricks               # handy helper scripts

        # Wine audio support
        faudio
        vkd3d            # Vulkan Direct3D bridge (needed for some games/audio in Wine)
    ];

    ####################
    # Optional Env Vars #
    ####################
    environment.sessionVariables = {
        WINEPREFIX = "$HOME/.wine";
        WINEARCH = "win64";  # default architecture for new prefixes
    };
}

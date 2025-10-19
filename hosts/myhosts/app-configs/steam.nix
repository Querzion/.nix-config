{ config, pkgs, ... }:

{
    hardware.steam-hardware.enable = true;

    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
        protontricks.enable = true;
        extest.enable = true; # For Wayland

        # Optional Steam network/firewall features
        # remotePlay.openFirewall = true;
        # dedicatedServer.openFirewall = true;
        # localNetworkGameTransfers.openFirewall = false;

        package = pkgs.steam.override {
            extraEnv = {
                # Change MangoHud to either 1 / off / default / fancy / legacy
                MANGOHUD = "1";         # enable Mangohud by default
                OBS_VKCAPTURE = "1";    # enable OBS Vulkan capture
                RADV_TEX_ANISO = "16";  # max anisotropic filtering
            };

            extraLibraries = pkgs: with pkgs; [
                #atk
            ];
        };

        extraPackages = with pkgs; [
            gamescope
            mangohud
            gamemode
        ];

        extraCompatPackages = with pkgs; [
            proton-ge-bin
            steamtinkerlaunch # Manage Proton versions/configs
        ];
    };
}

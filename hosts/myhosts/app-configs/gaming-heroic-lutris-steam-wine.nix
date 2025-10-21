{ config, pkgs, ... }:

{
  ####################
  # Gaming Packages  #
  ####################
  environment.systemPackages = with pkgs; [
    # Launchers
    heroic
    #lutris

    # Steam Helpers
    protonup-qt
    cabextract

    # Wine & tools
    wineWowPackages.full   # 32-bit + 64-bit support in one
    winetricks
    faudio

    # Performance tools
    gamemode
    mangohud
    gamescope
  ];

  ####################
  # Environment Vars #
  ####################
  environment.sessionVariables = {
    WINEPREFIX = "$HOME/.wine";
    WINEARCH = "win64";
    MANGOHUD = "1";
    OBS_VKCAPTURE = "1";
    RADV_TEX_ANISO = "16";
  };

  ####################
  # Steam Setup      #
  ####################
  hardware.steam-hardware.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    protontricks.enable = true;
    extest.enable = true; # Wayland support

    # Optional Steam features
    # remotePlay.openFirewall = true;
    # dedicatedServer.openFirewall = true;

    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = "1";
        OBS_VKCAPTURE = "1";
        RADV_TEX_ANISO = "16";
      };
    };

    extraPackages = with pkgs; [
      gamescope
      mangohud
      gamemode
    ];

    extraCompatPackages = with pkgs; [
      steamtinkerlaunch # Proton config tool
      #proton-ge-bin
    ];
  };

  ####################
  # Gamemode Config  #
  ####################
  programs.gamemode.enable = true;
}


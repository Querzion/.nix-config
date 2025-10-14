{ config, pkgs, ... }:

let
    dotnetSdks = with pkgs.dotnetCorePackages; combinePackages [ sdk_8_0 sdk_9_0 ];
in
{
    ####################
    # VSCode Settings  #
    ####################
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            ms-dotnettools.csharp
        ];
    };

    ####################
    # System Packages  #
    ####################
    environment.systemPackages = with pkgs; [
        #vscode
        dotnetSdks
    ];

    ####################
    # Environment Vars #
    ####################
    environment.sessionVariables = {
        # DOTNET_ROOT should point to the highest SDK installed
        DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_9_0}/share/dotnet";
        # Ensure dotnet binaries are on PATH
        PATH = "${pkgs.dotnetCorePackages.sdk_9_0}/bin:${pkgs.dotnetCorePackages.sdk_8_0}/bin:$PATH";
    };
}

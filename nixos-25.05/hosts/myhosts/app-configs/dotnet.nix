{ config, pkgs, ... }:

let
    dotnetSdks = with pkgs.dotnetCorePackages; combinePackages [ sdk_8_0 sdk_9_0 ];
    installTemplates = pkgs.writeShellScriptBin "install-dotnet-templates" ''
        #!/usr/bin/env bash
        set -e
        dotnet new install "Umbraco.Templates"
        dotnet new install "Avalonia.Templates"
        dotnet new install "DotVVM.Templates"
        dotnet new install "Popov1024.HttpApi.Template.CSharp"
        dotnet new install "RobBell.AksApi.Template"
        dotnet new install "GatewayProgrammingSchool.xUnit.CSharp"
        dotnet new install "eisk.webapi"
        echo "All .NET templates and workloads installed!"
    '';
in
{
    ####################
    # System Packages  #
    ####################
    environment.systemPackages = with pkgs; [
        dotnetSdks
        installTemplates
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

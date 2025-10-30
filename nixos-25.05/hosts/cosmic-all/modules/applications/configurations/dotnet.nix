{ config, pkgs, ... }:

let
  # Combine the two SDKs into a single derivation that contains both.
  # `combinePackages` already puts every `bin/` directory on $PATH.
  dotnetSdks = with pkgs.dotnetCorePackages;
    combinePackages [ sdk_8_0 sdk_9_0 ];

  # Run the template installations at activation time.
  # The script is executed as root, but `dotnet` will write the templates
  # into the system-wide store, so they are available to every user.
  installTemplates = pkgs.runCommandLocal "install-dotnet-templates" {
    buildInputs = [ dotnetSdks ];
  } ''
    mkdir -p $out
    dotnet new install "Umbraco.Templates"
    dotnet new install "Avalonia.Templates"
    dotnet new install "DotVVM.Templates"
    dotnet new install "Popov1024.HttpApi.Template.CSharp"
    dotnet new install "Robell.AksApi.Template"
    dotnet new install "GatewayProgrammingSchool.xUnit.CSharp"
    dotnet new install "eisk.webapi"
    echo "All .NET templates installed!" > $out/log
  '';
in
{
  ####################
  # System Packages  #
  ####################
  environment.systemPackages = with pkgs; [
    dotnetSdks
  ];

  # Install the templates when the system is activated.
  system.activationScripts.dotnet-templates = {
    text = ''
      # The derivation above already does the work; we just need to
      # ensure it is built.
      echo "Ensuring .NET templates are installed..."
      ${installTemplates}
    '';
    deps = [ "etc" ];
  };

  ####################
  # Environment Vars #
  ####################
  environment.sessionVariables = {
    # Highest SDK is the “official” root.
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_9_0}";

    # `combinePackages` already puts both bins on PATH, but we make it
    # explicit for clarity and to guarantee ordering (9 first, then 8).
    PATH = [
      "${pkgs.dotnetCorePackages.sdk_9_0}/bin"
      "${pkgs.dotnetCorePackages.sdk_8_0}/bin"
    ];
  };
}

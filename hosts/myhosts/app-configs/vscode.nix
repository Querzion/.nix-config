{ config, pkgs, ... }:

{
  ####################
  # VS Code          #
  ####################
  programs.vscode.enable = true;

  environment.systemPackages = with pkgs; [
    vscode-with-extensions.override {
      extensions = with pkgs.vscode-extensions; [
        ms-dotnettools.csharp
      ];
    }
  ];
}

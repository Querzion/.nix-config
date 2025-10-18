{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
  
    # Editors & IDEs
    jetbrains.rider
    jetbrains.rust-rover
    jetbrains.webstorm
    
    vscode # Using the vscode package directly
    # You can add specific extensions by overriding `vscode` here:
    #vscode.override {
    #  extensions = with pkgs.vscode-extensions; [
    #    ms-dotnettools.csharp
    #  ];
    #}
    
    android-tools
    android-studio
    azuredatastudio
    sql-studio

    # CLI tools & version managers
    rustup
    nodejs_24
    npm-check

    # Git & GitHub tooling
    github-desktop
    gh
    ghz
    lazygit

    # Build tools
    gnumake
    gcc

    postman
    insomnia
  ];
}

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
 
    # Editors & IDEs
    jetbrains.rider
    jetbrains.rust-rover
    jetbrains.webstorm
    vscode
    android-tools
    android-studio
    azuredatastudio
    sql-studio

    # CLI tools & version managers
    rustup
    nodejs
    #nodejs_24
    npm-check
    #python314
    python3
    python3Packages.pip

    # Git & GitHub tooling
    git
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

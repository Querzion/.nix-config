{ pkgs, ... }:

with pkgs;

[
    # Editors & IDEs
    jetbrains.rider
    jetbrains.rust-rover
    jetbrains.webstorm
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
]

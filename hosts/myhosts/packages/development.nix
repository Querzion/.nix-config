{ pkgs, ... }:

[
    # Editors & IDEs
    pkgs.vscode
    pkgs.jetbrains.rider
    pkgs.jetbrains.rust-rover
    pkgs.jetbrains.webstorm
    pkgs.android-studio
    pkgs.azuredatastudio
    pkgs.sql-studio

    # CLI tools & version managers
    pkgs.rustup
    pkgs.nodejs_24
    pkgs.npm-check
    pkgs.dotnetCorePackages.sdk_8_0
    pkgs.dotnetCorePackages.sdk_9_0

    # Git & GitHub tooling
    pkgs.github-desktop
    pkgs.gh
    pkgs.ghz

    # Terminal enhancements
    pkgs.starship
    pkgs.neovim

    # Docker for dev containers
    pkgs.docker_28
]

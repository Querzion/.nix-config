{ pkgs, ... }:

[
    # Editors & IDEs
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

    # Git & GitHub tooling
    pkgs.github-desktop
    pkgs.gh
    pkgs.ghz
    pkgs.lazygit

    # Build tools
    pkgs.gnumake
    pkgs.gcc
]

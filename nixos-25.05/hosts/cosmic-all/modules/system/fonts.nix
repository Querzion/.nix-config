{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Nerd Fonts
    nerd-fonts.caskaydia-mono
    nerd-fonts.jetbrains-mono

    # Microsoft Core Fonts
    corefonts

    # Google Fonts
    google-fonts
  ];
}

{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Nerd Fonts
    pkgs.nerd-fonts.caskaydia-mono
    pkgs.nerd-fonts.jetbrains-mono

    # Microsoft Core Fonts
    pkgs.corefonts

    # Google Fonts
    pkgs.google-fonts
  ];
}

{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    corefonts
    google-fonts
    nerd-fonts.caskaydia-mono
    nerd-fonts.jetbrains-mono
  ];
}

{ pkgs, ... }:

{
  imports = [
    ./bashrc.nix
    ./git.nix
    #./desktop-settings/plasma.breeze-settings.nix
    #./desktop-settings/plasma.capucchin-settings.nix
  ];

  programs.starship.enable = true;
  programs.fastfetch.enable = true;

  home.packages = with pkgs; [
    btop
    eza
  ];

  home.stateVersion = "25.05";
}

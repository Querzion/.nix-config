{ pkgs, ... }:

{
  imports = [
    ./bashrc.nix
    ./git.nix
  ];

  programs.starship.enable = true;
  programs.fastfetch.enable = true;

  home.packages = with pkgs; [
    pkgs.btop
    pkgs.eza
  ];

  services.xserver.xkb = {
    layout = "se";
    variant = "dvorak";
  };

  console.keyMap = "sv-latin1";

  home.stateVersion = "25.05";
}

{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)"
      fastfetch

      export NIXOS_DOTFILES=~/NixOS-Config
      export NIXOS_HOST=myhost

      alias nos-new='sudo nixos-rebuild switch --flake $NIXOS_DOTFILES#$NIXOS_HOST'
      alias nos-update='nix flake update $NIXOS_DOTFILES && nos-new'
      alias nos-upgrade='sudo nixos-rebuild switch --upgrade --flake $NIXOS_DOTFILES#$NIXOS_HOST'
    '';
  };

  programs.starship.enable = true;

  home.packages = with pkgs; [
    fastfetch
  ];

  home.stateVersion = "25.05";
}

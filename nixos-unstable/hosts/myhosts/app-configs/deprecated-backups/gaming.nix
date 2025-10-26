{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     # Game launchers
     heroic
     #lutris

     # other gaming tools
     protonup-qt
     #proton-ge-bin
     cabextract
  ];
}

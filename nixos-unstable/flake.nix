{
  description = "Slisk Lindqvist NixOS + Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/myhosts/configuration.nix
          home-manager.nixosModules.home-manager
          # <-- module function with pkgs in scope
          ({ config, pkgs, ... }: {
            environment.systemPackages = [
              pkgs.home-manager
            ];

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.querzion = import ./home/querzion/home.nix;
          })
        ];
      };
    };
}


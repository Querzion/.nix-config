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

      overlays = [
        (self: super: {
          onetbb = super.onetbb.overrideAttrs (oldAttrs: {
            doCheck = false;
          });
        })
      ];
    in
    {
      nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
        inherit system;
        nixpkgs.overlays = overlays;

        modules = [
          ./hosts/myhosts/configuration.nix
          home-manager.nixosModules.home-manager
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


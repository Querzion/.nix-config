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
          # Disable tests for onetbb to avoid build failures
          onetbb = super.onetbb.overrideAttrs (oldAttrs: {
            doCheck = false;
          });
        })
      ];
    in
    {
      nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
        inherit system;

        # Apply overlays
        nixpkgs.overlays = overlays;

        modules = [
          # Your base system configuration
          ./hosts/myhosts/configuration.nix

          # Home Manager module
          home-manager.nixosModules.home-manager

          # Inline user/home-manager configuration
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


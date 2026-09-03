{
  description = "home multisystem nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
      radar = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common/default.nix
          ./computers/radar/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.michael = import ./users/workstation.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
      rizzo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common/default.nix
          ./cocmputers/rizzo/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.michael = import ./users/workstation.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
  };
}

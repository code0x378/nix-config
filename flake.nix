{
  description = "code0x378 NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    # home-manager.url = "github:nix-community/home-manager/release-24.05";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NixOS ISO Generators
    nixos-generators.url = "github:nix-community/nixos-generators";

    # Nix Colors
    nix-colors.url = "github:misterio77/nix-colors";

    # Nix Index Database - Speed up lookups
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nix-colors, nix-index-database, ... }@inputs:
    let inherit (self) outputs;
    in {

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild switch --flake .#your-hostname' or . if your hostname matches
      nixosConfigurations = {

        cxCoreyann9 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/cxCoreyann9/configuration.nix
            nix-index-database.nixosModules.nix-index
          ];
        };

        cxThinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            # home-manager.nixosModules.home-manager
            # { home-manager.users.jeff = import ./home/default.nix; }
            ./hosts/cxThinkpad/configuration.nix
            nix-index-database.nixosModules.nix-index
          ];
        };

        cxYoga = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/cxYoga/configuration.nix
            nix-index-database.nixosModules.nix-index
          ];
        };

      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "jeff" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs nix-colors; };
          modules = [ ./home/default.nix ];
        };
      };
    };
}

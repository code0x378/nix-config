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
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nix-colors
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
    in
    {

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild switch --flake .#your-hostname' or . if your hostname matches
      nixosConfigurations = {

        cxCoreyann9 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/cxCoreyann9/configuration.nix
          ];
        };

        cxThinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            # home-manager.nixosModules.home-manager
            # { home-manager.users.jeff = import ./home/default.nix; }
            ./hosts/cxThinkpad/configuration.nix
          ];
        };

        cxYoga = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/cxYoga/configuration.nix
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

{
  description = "Root flake for repository";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      # Remember to update to 'nixfmt' after transition fase.
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;

      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          # inherit system;
          modules = [
            ./hosts/laptop
            ./modules
            ./overlays
            home-manager.nixosModules.home-manager
            nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd
          ];
          specialArgs = { inherit system self; };
        };

        desktop = nixpkgs.lib.nixosSystem {
          # inherit system;
          modules = [
            ./hosts/desktop
            ./modules
            ./overlays
            home-manager.nixosModules.home-manager
          ];

          specialArgs = { inherit system self; };
        };
      };
    };
}

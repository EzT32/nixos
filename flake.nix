{
  description = "Root flake for repository";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    import-tree.url = "github:denful/import-tree";
    den.url = "github:denful/den";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      # 'imports' defined which other NixOS modules to include in this one.
      imports = [
        # Aspect files to sweep into 'flake.modules.<class>.<aspect>'.
        (inputs.import-tree ./modules)

        # Each host sets 'flake.nixosConfigurations.<host>' directly.
        # Note: not a part of 'flake.modules'.
        (inputs.import-tree ./hosts)
      ];

      # Scopes pkgs to the current system, no architecture def needed.
      perSystem = { pkgs, ... }: {
        # TODO: switch to nixfmt once nixfmt-tree transition period ends.
        formatter = pkgs.nixfmt-tree;
      };
    };
}

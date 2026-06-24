# modules/overlays.nix
{ inputs, ... }:
{
  den.default.nixos.nixpkgs.overlays = [
    (import ./overlays/liac-arff.nix)
    (import ./overlays/openml.nix)
    (import ./overlays/vsg.nix)
    (final: prev: {
      unstable = import inputs.nixpkgs-unstable {
        inherit (prev) system;
        config.allowUnfree = true;
      };
    })
  ];
}

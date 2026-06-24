# modules/overlays.nix
{ inputs, ... }:
{
  den.default.nixos.nixpkgs.overlays = [
    (import ./overlays/liac-arff.nix)
    (import ./overlays/openml.nix)
    (import ./overlays/vsg.nix)
    (import ./overlays/unstable.nix { inherit inputs; })
  ];
}

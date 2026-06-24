# overlays/unstable.nix
{ inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      unstable = inputs.nixpkgs-unstable {
        inherit (prev) system;
        config.allowUnfree = true;
      };
    })
  ];
}

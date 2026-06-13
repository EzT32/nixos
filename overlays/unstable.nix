_: {
  nixpkgs.overlays = [
    (final: prev: {
      unstable = import.nixpkgs-unstable {
        inherit (prev) system;
        config.allowUnfree = true;
      };
    })
  ];
}

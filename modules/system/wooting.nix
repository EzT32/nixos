# modules/system/wooting.nix
_: {
  den.aspects.wooting = {
    nixos = _: {
      hardware.wooting.enable = true;
    };
  };
}

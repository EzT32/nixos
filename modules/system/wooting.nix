# modules/system/wooting.nix
{
  den.aspects.wooting = {
    nixos = _: {
      hardware.wooting.enable = true;
    };
  };
}

# modules/system/wooting.nix
{ den, ... }:
{
  den.aspects.wooting = {
    includes = [ (den.batteries.unfree [ "wootility" ]) ];
    nixos = _: {
      hardware.wooting.enable = true;
    };
  };
}

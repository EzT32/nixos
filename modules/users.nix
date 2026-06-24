# modules/users.nix
{ den, ... }:
{
  den.aspects.ezt = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
    ];
  };
}

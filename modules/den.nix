# modules/den.nix
{ inputs, lib, ... }:
{
  imports = [ inputs.den.flakeModule ];

  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  # Declare entities to say "these two things exist".
  den.hosts.x86_64-linux = {
    desktop.users.ezt = { };
    laptop.users.ezt = { };
  };
}

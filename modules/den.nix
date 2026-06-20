# modules/den.nix
{ den, lib, ... }:
{
  imports = [ den.flakeModule ];

  den.schema.user.classes = lib.mkDefault [ "home-manager" ];

  den.hosts.x86_64-linux.desktop.users.ezt = { };
  den.hosts.x86_64-linux.laptop.users.ezt = { };
}

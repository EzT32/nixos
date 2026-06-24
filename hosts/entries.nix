# hosts/entries.nix
{ inputs, ... }:
{
  imports = [ inputs.den.flakeModule ];

  # Declare entities to say "these two things exist".
  den.hosts.x86_64-linux.desktop.users.ezt = { };
  den.hosts.x86_64-linux.laptop.users.ezt = { };
}

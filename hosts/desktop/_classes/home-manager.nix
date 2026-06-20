# hosts/desktop/_aspects.nix
{
  config,
  ...
}:
let
  username = "ezt";
in
{
  # NixOS class aspects this host wants.
  # Include aspects from the shared tree/namespace.
  # Anything not listed will not be part of the host.

  home-manager.users.${username} = {
    imports = with config.flake.modules.homeManager; [
      # todo: add aspects here once refactor is complete.
      discord
    ];

    home.stateVersion = "26.05";

    # Aspect-option overrides.
    discord.vencord = false;
  };
}

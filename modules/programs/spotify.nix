# modules/programs/spotify.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.spotify;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.spotify = {
    enable = lib.options.mkUnsetOption "Spotify";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "programs"
        "media"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          home.packages = with pkgs; [
            spotify
          ];
        };
      };
}

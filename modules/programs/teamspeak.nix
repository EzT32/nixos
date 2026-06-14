# modules/programs/teamspeak.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.teamspeak;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.teamspeak = {
    enable = lib.options.mkUnsetOption "Teamspeak";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "programs"
        "communication"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          home.packages = with pkgs; [
            teamspeak6-client
          ];
        };
      };
}

# modules/programs/syncplay.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.syncplay;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.syncplay = {
    enable = lib.mkEnableOption "Syncplay";
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
            syncplay
          ];
        };
      };
}

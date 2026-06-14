# modules/programs/vlc.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.vlc;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.vlc = {
    enable = lib.mkUnsetOption "Vlc";
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
            vlc
          ];
        };
      };
}

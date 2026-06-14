# modules/programs/mpv.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.mpv;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.mpv = {
    enable = lib.options.mkUnsetOption "Mpv";
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
            mpv
          ];
        };
      };
}

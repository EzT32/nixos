# modules/programs/pinta.nix
{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.pinta;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.pinta = {
    enable = lib.options.mkUnsetOption "Pinta";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "programs"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          home.packages = with pkgs; [
            pinta
          ];
        };
      };
}

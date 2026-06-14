# modules/programs/localsend.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.localsend;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.localsend = {
    enable = lib.options.mkUnsetOption "Localsend";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "programs"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          home.packages = [
            (pkgs.writeShellScriptBin "localsend" ''
              exec ${pkgs.localsend}/bin/localsend_app "$@"
            '')
            pkgs.localsend
          ];
        };
      };
}

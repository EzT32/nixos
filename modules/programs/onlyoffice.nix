# modules/programs/onlyoffice.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.onlyoffice;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.onlyoffice = {
    enable = lib.options.mkUnsetOption "Onlyoffice";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "programs"
        "work"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          home.packages = with pkgs; [
            onlyoffice-desktopeditors
          ];
        };
      };
}

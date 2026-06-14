# modules/programs/libreoffice.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.libreoffice;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.libreoffice = {
    enable = lib.options.mkUnsetOption "Libreoffice";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "work"
        "programs"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          home.packages = with pkgs; [
            libreoffice
          ];
        };
      };
}

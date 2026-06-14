# modules/cli/eza.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.cli.eza;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.cli.eza = {
    enable = lib.options.mkUnsetOption "Eza";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "cli"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          programs.eza = {
            enable = true;
          };
        };
      };
}

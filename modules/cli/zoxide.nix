# modules/cli/zoxide.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.cli.zoxide;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.cli.zoxide = {
    enable = lib.mkEnableOption "Zoxide";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "cli"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          programs.zoxide = {
            enable = true;
            options = [ "--cmd cd" ];
          };
        };
      };
}

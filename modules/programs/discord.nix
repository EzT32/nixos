# modules/programs/discord.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.discord;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.discord = {
    enable = lib.options.mkUnsetOption "Custom module for Discord";

    openASAR = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };

    vencord = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
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
            (discord.override {
              withOpenASAR = cfg.openASAR;
              withVencord = cfg.vencord;
            })
          ];
        };
      };
}

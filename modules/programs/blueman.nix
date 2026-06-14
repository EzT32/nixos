# modules/programs/blueman.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.blueman;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.blueman = {
    enable = lib.options.mkUnsetOption "Blueman";
    startup = lib.options.mkUnsetOption "Launch blueman on startup";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "programs"
        "bluetooth"
      ] enableGroups)
      {

        services.blueman.enable = true;

        home-manager.users.${user.username} = {
          xdg.configFile."autostart/blueman.desktop".text = ''
            [Desktop Entry]
            Hidden=${lib.boolToString (!cfg.startup)}
          '';
        };
      };
}

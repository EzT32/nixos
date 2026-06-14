# modules/programs/firefox.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.programs.firefox;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.firefox = {
    enable = lib.options.mkUnsetOption "Firefox";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "programs"
        "media"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          programs.firefox = {
            enable = true;
            profiles.default = {
              settings = {
                "media.default_volume" = "0.5";
              };
            };
          };
        };
      };
}

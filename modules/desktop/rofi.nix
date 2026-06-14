# modules/desktop/rofi.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.rofi;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.rofi = {
    enable = lib.options.mkUnsetOption "Rofi";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "desktop"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          programs.rofi = {
            enable = true;

            theme = "gruvbox-dark";

            extraConfig = {
              show-icons = true;
              icon-theme = "breeze";
              drun-display-format = "{name} {icon}";
            };
          };
        };
      };
}

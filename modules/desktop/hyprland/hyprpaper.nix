# modules/desktop/hyprland/hyprpaper.nix
{
  config,
  lib,
  self,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.hyprpaper;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.hyprland.hyprpaper = {
    enable = lib.options.mkUnsetOption "Custom module for hyprpaper";

    path = lib.mkOption {
      type = lib.types.path;
      default = "${self}/wallpapers";
      description = "Path to the directory containing wallpapers for hyprpaper.";
      example = "~/path/to/wallpaper/folder";
    };

    wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "NixGruvbox.png";
      description = "Wallpaper file to use for hyprlock backbround.";
      example = "Wallpaper.png";
    };
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "desktop"
        "hyprland"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          services.hyprpaper = {
            enable = true;

            settings = {
              splash = false;

              preload = [ "${cfg.path}/${cfg.wallpaper}" ];
              wallpaper = [
                {
                  monitor = ""; # empty string = all monitors / fallback
                  path = "${cfg.path}/${cfg.wallpaper}";
                }
              ];
            };
          };
        };
      };
}

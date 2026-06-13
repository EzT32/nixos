{
  lib,
  config,
  self,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.hyprpaper;
in
{
  options.modules.desktop.hyprland.hyprpaper = {
    enable = lib.mkEnableOption "Enable modules hyprpaper module.";

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

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      # wayland.windowManager.hyprland.settings = {
      #   exec-once = [ "hyprpaper" ];
      # };

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

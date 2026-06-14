# modules/desktop/hyprland/hyprlock.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.hyprlock;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.hyprland.hyprlock = {
    enable = lib.mkUnsetOption "Custom module for hyprlock";

    path = lib.mkOption {
      type = lib.types.path;
      default = "${config.home-manager.users.ezt.home.homeDirectory}/nixos/wallpapers";
      description = "Path to the directory containing wallpapers for hyprlock.";
      example = "~/path/to/wallpaper/folder";
    };

    wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "NixGruvbox.png";
      description = "Wallpaper file to use for hyprlock background.";
      example = "Wallpaper.png";
    };

    grace = lib.mkOption {
      type = lib.types.int;
      default = 60;
      description = "Number of seconds grace period before locking again.";
      example = 60;
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
          settings = {
            general = {
              disable_loading_bar = true;
              grace = cfg.grace;
              hide_cursor = true;
              no_fade_in = false;
            };

            background = [
              {
                path = "${cfg.path}/${cfg.wallpaper}";
                blur_passes = 3;
                blur_size = 8;
              }
            ];

            input-field = [
              {
                size = "200, 50";
                position = "0, -80";
                monitor = "";
                dots_center = true;
                fade_on_empty = false;
                font_color = "rgb(202, 211, 245)";
                inner_color = "rgb(91, 96, 120)";
                outer_color = "rgb(24, 25, 38)";
                outline_thickness = 5;
                placeholder_text = "<span foreground='##cad3f5'>Password...</span>";
                shadow_passes = 2;
              }
            ];
          };
        };
      };
}

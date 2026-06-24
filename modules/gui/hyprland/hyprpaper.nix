# modules/gui/hyprland/hyprpaper.nix
{ self, ... }:
{
  den.aspects.hyprpaper = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      let
        cfg = config.hyprland.hyprpaper;
      in
      {
        options.hyprland.hyprpaper = {
          path = lib.mkOption {
            type = lib.types.path;
            default = "${self}/wallpapers";
            description = "Path to the directory containing wallpapers for hyprpaper.";
            example = "~/path/to/wallpaper/folder";
          };

          wallpaper = lib.mkOption {
            type = lib.types.str;
            default = "Scatter_gruvbox.png";
            description = "Wallpaper file to use for hyprlock background.";
            example = "Wallpaper.png";
          };
        };

        config = {
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
  };
}

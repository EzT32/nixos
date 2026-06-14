# modules/desktop/cursor.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.cursor;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.cursor = {
    enable = lib.options.mkUnsetOption "Custom module using pointerCursor";

    theme = lib.mkOption {
      type = lib.types.str;
      default = "Bibata-Modern-Ice";
      description = "GTK cursor theme.";
      example = "Bibata-Modern-Ice";
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.bibata-cursors;
      description = "Package providing the cursor theme.";
      example = "pkgs.bibata-cursors";
    };

    size = lib.mkOption {
      type = lib.types.int;
      default = 8;
      description = "Cursor size.";
      example = 8;
    };
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "desktop"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          home.pointerCursor = {
            name = cfg.theme;
            size = cfg.size;
            package = cfg.package;
            hyprcursor.enable = true;
            x11.enable = true;
            gtk.enable = true;
          };
        };
      };
}

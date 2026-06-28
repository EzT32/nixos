# modules/desktop/cursor.nix
{
  den.aspects.cursor = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        options.cursor = {
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

        config = {
          home.pointerCursor = {
            name = config.cursor.theme;
            size = config.cursor.size;
            package = config.cursor.package;
            hyprcursor.enable = true;
            x11.enable = true;
            gtk.enable = true;
          };
        };
      };
  };
}

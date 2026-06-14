# modules/desktop/environment.nix
{
  config,
  lib,
  ...
}:
let
  enableGroups = config.modules.enableGroups;
in
{
  config =
    lib.mkIf
      (lib.modules.inGroups [
        "desktop"
      ] enableGroups)
      {

        environment = {
          sessionVariables = {
            NIXOS_OZONE_WL = "1";
            GDK_SCALE = "1.5";
            QT_SCALE_FACTOR = "1";

            WLR_NO_HARDWARE_CURSORS = "1";
            EDITOR = "nvim";
          };
        };
      };
}

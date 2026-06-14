# modules/desktop/xdg.nix
{
  config,
  lib,
  pkgs,
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

        xdg.portal = {
          enable = true;
          wlr.enable = true;

          # Use xdg portals in lexographic priority
          config.common.default = "*";

          extraPortals = with pkgs; [
            xdg-desktop-portal
            xdg-desktop-portal-hyprland
            xdg-desktop-portal-gtk
          ];
        };
      };
}

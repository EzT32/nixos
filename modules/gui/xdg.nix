# modules/desktop/xdg.nix
{
  den.aspects.xdg = {
    nixos = { pkgs, ... }: {
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
  };
}

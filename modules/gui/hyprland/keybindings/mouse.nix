# modules/gui/hyprland/binds/mouse.nix
{
  den.aspects.hyprland-mouse-binds = {
    homeManager = _: {
      config = {
        wayland.windowManager.hyprland.settings = {
          bindm = [
            "SUPER, mouse:272, movewindow"
            "SUPER, mouse:273, resizewindow"
          ];
        };
      };
    };
  };
}

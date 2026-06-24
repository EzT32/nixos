# modules/gui/hyprland/binds/window.nix
{
  den.aspects.hyprland-window-binds = {
    homeManager = _: {
      wayland.windowManager.hyprland.settings = {
        bind = [
          "SUPER, Q, killactive"

          "SUPERSHIFT, H, movewindow, l"
          "SUPERSHIFT, L, movewindow, r"
          "SUPERSHIFT, K, movewindow, u"
          "SUPERSHIFT, J, movewindow, d"

          # Screen mode
          "SUPER, F, fullscreen, 1"
          "SUPERSHIFT, F, fullscreen, 0"
          "SUPER, G, togglefloating"

          "ALT, TAB, cyclenext"
        ];

        bindr = [
          "ALT, TAB, bringactivetotop"
        ];
      };
    };
  };
}

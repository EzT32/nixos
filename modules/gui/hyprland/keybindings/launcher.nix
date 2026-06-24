# modules/gui/hyprland/binds/launcher.nix
{
  den.aspects.hyprland-launcher-binds = {
    homeManager = _: {
      config = {
        wayland.windowManager.hyprland.settings = {
          bind = [
            "SUPER, T, exec, kitty"
            "SUPERSHIFT, B, exec, firefox"
          ];

          bindr = [
            "SUPER, SUPER_L, exec, kill $(pidof rofi) || rofi -show drun"
          ];
        };
      };
    };
  };
}

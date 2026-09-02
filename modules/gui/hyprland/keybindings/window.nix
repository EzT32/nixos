# modules/gui/hyprland/binds/window.nix
{
  den.aspects.hyprland-window-binds = {
    homeManager = { pkgs, ... }: {
      config =
        let
          toggleMirror = pkgs.writeShellApplication {
            name = "toggle-mirror";
            runtimeInputs = [
              pkgs.jq
              pkgs.libnotify
            ];
            text = ''
              MAIN="eDP-1"

              mapfile -t externals < <(hyprctl monitors all -j | jq -r --arg main "$MAIN" \
                '.[] | select(.name != $main) | .name')

              if [ "''${#externals[@]}" -eq 0 ]; then
                notify-send "No external monitor connected"
                exit 1
              fi

              PROJECTOR="''${externals[0]}"

              current=$(hyprctl monitors all -j | jq -r --arg p "$PROJECTOR" \
                '.[] | select(.name==$p) | .mirrorOf')

              if [ "$current" = "none" ] || [ -z "$current" ]; then
                hyprctl keyword monitor "$PROJECTOR,preferred,auto,1,mirror,$MAIN"
                notify-send "Mirroring on" "$MAIN -> $PROJECTOR"
              else
                hyprctl keyword monitor "$PROJECTOR,preferred,auto,1"
                notify-send "Mirroring off" "$PROJECTOR extended"
              fi
            '';
          };
        in
        {
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

              "SUPERSHIFT, P, exec, ${toggleMirror}/bin/toggle-mirror"
            ];

            bindr = [
              "ALT, TAB, bringactivetotop"
            ];
          };

          home.packages = [
            toggleMirror
          ];
        };
    };
  };
}

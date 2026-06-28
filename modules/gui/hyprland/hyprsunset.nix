# modules/gui/hyprland/hyprsunset.nix
{
  den.aspects.hyprsunset = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      let
        cfg = config.hyprland.hyprsunset;

        toggleScript = pkgs.writeShellScript "hyprsunset-toggle" ''
          state_file="$XDG_RUNTIME_DIR/hyprsunset-on"

          if [ -f "$state_file" ]; then
            rm -f "$state_file"
            hyprctl hyprsunset identity
          else
            touch "$state_file"
            hyprctl hyprsunset temperature ${toString cfg.temperature}
          fi
        '';
      in
      {
        options.hyprland.hyprsunset.temperature = lib.mkOption {
          type = lib.types.int;
          default = 4500;
          description = "Colour temperature (Kelvin) applied when the warm filter is active.";
        };

        config = {
          services.hyprsunset.enable = true;

          wayland.windowManager.hyprland.settings.bindl = [
            "SUPERSHIFT, n, exec, ${toggleScript}"
          ];
        };
      };
  };
}

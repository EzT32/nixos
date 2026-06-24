# modules/gui/hyprland/hyprland.nix
{
  den.aspects.hyprland = {
    homeManager =
      { config, lib, ... }:
      {
        options.hyprland = {
          sensitivity = lib.mkOption {
            type = lib.types.float;
            default = 0.0;
            description = "Hyprland sensitivity (supports negative numbers).";
            example = -0.5;
          };
        };

        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;
          systemd.enable = false;

          configType = "hyprlang";

          settings = {
            xwayland.force_zero_scaling = true;

            general = {
              gaps_in = 2;
              gaps_out = 4;
            };

            input = {
              kb_layout = "no";
              sensitivity = config.hyprland.sensitivity;

              touchpad = {
                natural_scroll = true;
                disable_while_typing = false;
              };

              follow_mouse = 2;
            };

            misc = {
              mouse_move_focuses_monitor = false;
            };

            monitor = [
              "desc:Acer Technologies KG271 TF5EE0098522, 1920x1080@143.98Hz, 0x0, auto"
              "desc:BNQ BenQ GL2450 K2E02672019, preferred, auto-right, auto"
            ];
          };
        };
      };
  };

  nixos = _: {
    programs.hyprland.enable = true;
    programs.hyprland.withUWSM = true;
  };
}

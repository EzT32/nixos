# modules/gui/hyprland/hyprland.nix
{ den, ... }:
{
  den.aspects.hyprland = {
    includes = [
      den.aspects.hyprland-launcher-binds
      den.aspects.hyprland-media-binds
      den.aspects.hyprland-mouse-binds
      den.aspects.hyprland-window-binds
      den.aspects.hyprland-workspace-binds
    ];

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
          configType = "hyprlang";

          xwayland.enable = true;
          systemd.enable = false;
          misc.mouse_move_focuses_monitor = false;

          settings = {
            xwayland.force_zero_scaling = true;

            general = {
              gaps_in = 2;
              gaps_out = 4;
            };

            input = {
              kb_layout = "no";
              sensitivity = config.hyprland.sensitivity;
              follow_mouse = 2;

              touchpad = {
                natural_scroll = true;
                disable_while_typing = false;
              };
            };

            monitor = [
              "desc:Acer Technologies KG271 TF5EE0098522, 1920x1080@143.98Hz, 0x0, auto"
              "desc:BNQ BenQ GL2450 K2E02672019, preferred, auto-right, auto"
            ];
          };
        };
      };

    nixos = _: {
      programs.hyprland.enable = true;
      programs.hyprland.withUWSM = true;
    };
  };
}

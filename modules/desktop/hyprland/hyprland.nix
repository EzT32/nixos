{ lib, config, ... }:
let
  cfg = config.modules.desktop.hyprland;
in
{
  options.modules.desktop.hyprland = {
    enable = lib.mkEnableOption "Enable hyprland configurations.";

    sensitivity = lib.mkOption {
      type = lib.types.float;
      default = 0.0;
      description = "Hyprland sensitivity (supports negative numbers).";
      example = -0.5;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;
    programs.hyprland.withUWSM = true;

    home-manager.users.ezt = {
      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
          xwayland.force_zero_scaling = true;

          general = {
            gaps_in = 2;
            gaps_out = 5;
          };

          input = {
            kb_layout = "no";

            sensitivity = cfg.sensitivity;

            touchpad = {
              natural_scroll = true;
              disable_while_typing = false;
            };
          };
          windowrulev2 = [
            "tile, class:^(steam)$"
          ];

          monitor = [
            "desc:Acer Technologies KG271 TF5EE0098522, 1920x1080@143.98Hz, 0x0, auto"
            "desc:BNQ BenQ GL2450 K2E02672019, preferred, auto-right, auto"
          ];
        };
      };
    };
  };
}

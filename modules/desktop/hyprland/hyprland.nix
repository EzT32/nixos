# modules/desktop/hyprland/hyprland.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.hyprland;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.hyprland = {
    enable = lib.options.mkUnsetOption "Hyprland";

    sensitivity = lib.mkOption {
      type = lib.types.float;
      default = 0.0;
      description = "Hyprland sensitivity (supports negative numbers).";
      example = -0.5;
    };
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "hyprland"
      ] enableGroups)
      {

        programs.hyprland.enable = true;
        programs.hyprland.withUWSM = true;

        home-manager.users.${user.username} = {
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

                sensitivity = cfg.sensitivity;

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
      };
}

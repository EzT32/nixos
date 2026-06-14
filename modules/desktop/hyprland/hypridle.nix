# modules/desktop/hyprland/hypridle.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.hypridle;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.hyprland.hypridle = {
    enable = lib.options.mkUnsetOption "Custom module for hypridle";

    lockTimeout = lib.mkOption {
      type = lib.types.int;
      default = 900;
      description = "Seconds before locking screen";
    };

    dpmsTimeout = lib.mkOption {
      type = lib.types.int;
      default = 900;
      description = "Seconds before turning off display";
    };
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "hyprland"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          enable = true;

          services.hypridle = {
            settings = {
              general = {
                after_sleep_cmd = "hyprctl dispatch dpms on";
                ignore_dbus_inhibit = false;
                lock_cmd = "hyprlock";
              };

              listener = [
                {
                  timeout = cfg.lockTimeout;
                  on-timeout = "hyprlock";
                }
                {
                  timeout = cfg.dpmsTimeout;
                  on-timeout = "hyprctl dispatch dpms off";
                  on-resume = "hyprctl dispatch dpms on";
                }
              ];
            };
          };
        };
      };
}

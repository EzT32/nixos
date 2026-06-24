# modules/gui/hyprland/hypridle.nix
{ den, ... }:
{
  den.aspects.hypridle = {
    includes = [ den.aspects.hyprlock ];

    homeManager = { config, lib, ... }: {
      options.hyprland.hypridle = {
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

      services.hypridle = {
        settings = {
          general = {
            after_sleep_cmd = "hyprctl dispatch dpms on";
            ignore_dbus_inhibit = false;
            lock_cmd = "hyprlock";
          };

          listener = [
            {
              timeout = config.hyprland.hypridle.lockTimeout;
              on-timeout = "hyprlock";
            }
            {
              timeout = config.hyprland.hypridle.dpmsTimeout;
              on-timeout = "hyprctl dispatch dpms off";
              on-resume = "hyprctl dispatch dpms on";
            }
          ];
        };
      };
    };
  };
}

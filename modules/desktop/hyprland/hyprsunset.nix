{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.hyprsunset;

  hyprctl-bin = "${pkgs.hyprland}/bin/hyprctl";

  toggleScript = pkgs.writeShellScript "hyprsunset-toggle" ''
    STATE_FILE="''${XDG_RUNTIME_DIR}/hyprsunset-on"

    if [ -f "$STATE_FILE" ]; then
      rm -f "$STATE_FILE"
      ${hyprctl-bin} hyprsunset identity
    else
      touch "$STATE_FILE"
      ${hyprctl-bin} hyprsunset temperature ${toString cfg.temperature}
    fi
  '';
in
{
  options.modules.desktop.hyprland.hyprsunset = {
    enable = lib.mkEnableOption "hyprsunset blue-light filter";

    user = lib.mkOption {
      type = lib.types.str;
      default = "ezt";
      description = "The home-manager user to configure hyprsunset for.";
    };

    temperature = lib.mkOption {
      type = lib.types.int;
      default = 4500;
      description = "Colour temperature (Kelvin) applied when the warm filter is active.";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${cfg.user} = {
      services.hyprsunset.enable = true;

      wayland.windowManager.hyprland.settings = {
        bindl = [
          "SUPERSHIFT, n, exec, ${toggleScript}"
        ];
      };
    };
  };
}

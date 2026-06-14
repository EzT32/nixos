# modules/presets/desktop.nix
{
  config,
  lib,
  ...
}:
{
  # Import defined modules if hostName matches.
  config = lib.mkIf (config.networking.hostName == "desktop") {
    # Configuration of custom modules
    modules = {
      desktop = {
        hyprland = {
          hypridle.enable = false;
          hyprlock.enable = false;

          sensitivity = -0.5;
        };
      };

      enableGroups = [
        "amd"
        "gaming"
      ];
    };
  };
}

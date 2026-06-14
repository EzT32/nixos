# modules/presets/desktop/configuration.nix
{
  config,
  lib,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  # Import defined modules if hostName matches.
  config = lib.mkIf (config.networking.hostName == "desktop") {
    # Configuration of custom modules
    modules = {
      desktop = {
        hyprland.sensitivity = -0.5;
      };

      programs = {
        lact.enable = true;
      };
    };
  };
}

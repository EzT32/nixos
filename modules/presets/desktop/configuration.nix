# modules/presets/desktop/configuration.nix
{
  config,
  lib,
  ...
}:
# Import defined modules if hostName matches.
lib.mkIf (config.networking.hostName == "desktop") {

  import = [ ./hardware-configuration.nix ];

  # Configuration of custom modules
  modules = {
    desktop = {
      hyprland.sensitivity = -0.5;
    };

    programs = {
      lact.enable = true;
    };
  };
}

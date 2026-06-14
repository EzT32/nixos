# modules/presets/laptop/configuration.nix
{
  config,
  lib,
  ...
}:
# Import defined modules if hostName matches.
lib.mkIf (config.networking.hostName == "laptop") {

  import = [ ./hardware-configuration.nix ];

  # Configuration of custom modules
  modules = {
    desktop = {
      hyprland = {
        keybinds.laptop.enable = true;
      };

      cursor.size = 24;
    };
  };
}

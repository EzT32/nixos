# modules/presets/laptop/configuration.nix
{
  config,
  lib,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  # Import defined modules if hostName matches.
  config = lib.mkIf (config.networking.hostName == "laptop") {
    # Configuration of custom modules
    modules = {
      desktop = {
        hyprland = {
          keybinds.laptop.enable = true;
        };

        cursor.size = 24;
      };
    };
  };
}

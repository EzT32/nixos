# modules/presets/laptop.nix
{
  config,
  lib,
  ...
}:
{
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

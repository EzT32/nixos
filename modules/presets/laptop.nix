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
        cursor.size = 24;
      };

      enableGroups = [
        "hyprland-binds"
        "work"
        "bluetooth"
      ];
    };
  };
}

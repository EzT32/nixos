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
      prismlauncher.enable = true;
      syncplay.enable = true;
      steam.enable = true;
      pinta.enable = true;
      vscode.enable = true;
      obsidian.enable = true;
      teamspeak.enable = true;
      lact.enable = true;
    };
  };
}

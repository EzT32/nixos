# modules/desktop/hyprland/keybinds/launchers.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.keybinds.launchers;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.hyprland.keybinds.launchers = {
    enable = lib.options.mkUnsetOption "Launcher keybinds";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "hyprland-binds"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          wayland.windowManager.hyprland.settings = {
            bind = [
              "SUPER, T, exec, kitty"
              "SUPERSHIFT, B, exec, firefox"
            ];

            bindr = [
              "SUPER, SUPER_L, exec, kill $(pidof rofi) || rofi -show drun"
            ];
          };
        };
      };
}

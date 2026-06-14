# modules/desktop/hyprland/keybinds/mouse.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.keybinds.mouse;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.hyprland.keybinds.mouse = {
    enable = lib.options.mkUnsetOption "Mouse keybinds";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "desktop"
        "hyprland"
        "hyprland-binds"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          wayland.windowManager.hyprland.settings = {
            bindm = [
              "SUPER, mouse:272, movewindow"
              "SUPER, mouse:273, resizewindow"
            ];
          };
        };
      };
}

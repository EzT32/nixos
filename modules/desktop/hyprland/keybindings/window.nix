# modules/desktop/hyprland/keybinds/window.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.keybinds.window;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.hyprland.keybinds.window = {
    enable = lib.mkUnsetOption "Window management keybinds";
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
            bind = [
              "SUPER, Q, killactive"

              "SUPERSHIFT, H, movewindow, l"
              "SUPERSHIFT, L, movewindow, r"
              "SUPERSHIFT, K, movewindow, u"
              "SUPERSHIFT, J, movewindow, d"

              # Screen mode
              "SUPER, F, fullscreen, 1"
              "SUPERSHIFT, F, fullscreen, 0"
              "SUPER, G, togglefloating"

              "ALT, TAB, cyclenext"
            ];

            bindr = [
              "ALT, TAB, bringactivetotop"
            ];
          };
        };
      };
}

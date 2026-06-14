# modules/desktop/hyprland/keybinds/media.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.hyprland.keybinds.media;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.desktop.hyprland.keybinds.media = {
    enable = lib.options.mkUnsetOption "Media keybinds";

    volumeStep = lib.mkOption {
      type = lib.types.int;
      default = 5;
      description = "Percentage change in volume";
      example = 5;
    };

    maxVolume = lib.mkOption {
      type = lib.types.float;
      default = 1.0;
      description = "Max volume level";
      example = 1.0;
    };
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
              # Screenshots
              ", PRINT, exec, grim ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"
              "SHIFT, PRINT, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H%M%S').png"
              # Select a region, take a screenshot, and open in swappy for annotation
              "SUPERSHIFT, S, exec, grim -g \"$(slurp)\" - | swappy -f -"
            ];

            bindl = [
              ", XF86AudioPlay, exec, playerctl play-pause"
              ", XF86AudioPrev, exec, playerctl previous"
              ", XF86AudioNext, exec, playerctl next"

              ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ];

            bindel = [
              ", XF86AudioRaiseVolume, exec, wpctl set-volume -l ${toString cfg.maxVolume} @DEFAULT_AUDIO_SINK@ ${toString cfg.volumeStep}%+"

              ", XF86AudioLowerVolume, exec, wpctl set-volume -l ${toString cfg.maxVolume} @DEFAULT_AUDIO_SINK@ ${toString cfg.volumeStep}%-"
            ];
          };

          home.packages = with pkgs; [
            grim
            slurp
            swappy
          ];
        };

        environment.systemPackages = with pkgs; [
          playerctl
        ];
      };
}

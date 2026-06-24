# modules/gui/hyprland/binds/laptop.nix
{
  den.aspects.hyprland-laptop-binds = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      let
        cfg = config.hyprland.binds.laptop;

        updateMicLed = pkgs.writeShellScript "update-mic-led" ''
          micStatus=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -c MUTED)
          brightnessctl -d platform::micmute set "$micStatus > /dev/null"
        '';

        toggleMic = pkgs.writeShellScript "toggle-mic" ''
          wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
          ${updateMicLed}
        '';
      in
      {
        options.hyprland.binds.laptop.brightnessStep = lib.mkOption {
          type = lib.types.int;
          default = 10;
          description = "Percentage change in brightness";
          example = 10;
        };

        wayland.windowManager.hyprland.settings = {
          bindl = [
            ", XF86AudioMicMute, exec, ${toggleMic}"
          ];

          binde = [
            ", XF86MonBrightnessDown, exec, brightnessctl set ${toString cfg.brightnessStep}%-"
            ", XF86MonBrightnessUp, exec, brightnessctl set ${toString cfg.brightnessStep}%+"
          ];
        };
      };

    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.brightnessctl ];
    };
  };
}

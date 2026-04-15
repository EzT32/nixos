{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.modules.desktop.hyprland.keybinds.laptop;

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
  options.modules.desktop.hyprland.keybinds.laptop = {
    enable = lib.mkEnableOption "Laptop-specific keybinds";

    brightnessStep = lib.mkOption {
      type = lib.types.int;
      default = 10;
      description = "Percentage change in brightness";
      example = 10;
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
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
    environment.systemPackages = with pkgs; [
      brightnessctl
    ];
  };
}

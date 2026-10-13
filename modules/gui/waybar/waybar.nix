# modules/gui/waybar/waybar.nix
{
  den.aspects.waybar.homeManager = _: {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      style = ./style.css;

      settings.main-bar = {
        layer = "top";
        position = "top";
        spacing = 4;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "cpu"
          "memory"
          "battery"
          "network"
          "wireplumber"
        ];
      };
    };
  };
}

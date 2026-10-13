# modules/gui/waybar/tray.nix
{
  den.aspects.waybar.homeManager = _: {
    programs.waybar.settings.main-bar.tray = {
      icon-size = 16;
      spacing = 8;
      show-passive-items = true;
      tooltip = false;
    };
  };
}

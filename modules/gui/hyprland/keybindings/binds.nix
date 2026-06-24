# modules/gui/hyprland/binds/binds.nix
{ den, ... }:
{
  den.aspects.hyprland-binds = {
    includes = [
      den.aspects.hyprland-launcher-binds
      den.aspects.hyprland-media-binds
      den.aspects.hyprland-mouse-binds
      den.aspects.hyprland-window-binds
      den.aspects.hyprland-workspace-binds
    ];
  };
}

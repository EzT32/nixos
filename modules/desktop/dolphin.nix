# modules/desktop/dolphin.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.dolphin;
  enableGroups = config.modules.enableGroups;
in
{
  options.modules.desktop.dolphin = {
    enable = lib.mkUnsetOption "Dophin file explorer";
  };

  config = lib.mkIf (lib.modules.isEnabled cfg.enable [ "desktop" ] enableGroups) {

    environment.systemPackages = with pkgs; [
      kdePackages.dolphin
      kdePackages.qtsvg
    ];
  };
}

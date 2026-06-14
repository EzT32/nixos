# modules/fonts/fonts.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.system.fonts;
  enableGroups = config.modules.enableGroups;
in
{
  config =
    lib.mkIf
      (lib.modules.inGroups cfg.enable [
        "fonts"
      ] enableGroups)
      {

        fonts = {
          packages = with pkgs; [
            corefonts
          ];
        };
      };
}

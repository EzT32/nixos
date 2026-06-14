# modules/fonts/fonts.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  enableGroups = config.modules.enableGroups;
in
{
  config =
    lib.mkIf
      (lib.modules.inGroups [
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

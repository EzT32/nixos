# modules/system/fonts.nix
{ den, ... }:
{
  den.aspects.fonts = {
    includes = [ (den.batteries.unfree [ "corefonts" ]) ];

    nixos = { pkgs, ... }: {
      fonts = {
        packages = with pkgs; [
          corefonts
        ];
      };
    };
  };
}

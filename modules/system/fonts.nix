# modules/system/fonts.nix
{
  den.aspects.fonts = {
    nixos = { pkgs, ... }: {
      fonts = {
        packages = with pkgs; [
          corefonts
        ];
      };
    };
  };
}

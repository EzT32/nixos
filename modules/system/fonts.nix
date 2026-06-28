# modules/system/fonts.nix
_: {
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

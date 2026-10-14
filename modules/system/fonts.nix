# modules/system/fonts.nix
_: {
  den.aspects.fonts = {

    nixos = { pkgs, ... }: {
      fonts = {
        fontDir.enable = true;

        packages = with pkgs; [
          corefonts
          stix-two
          libertinus
          lmmath
          noto-fonts
          dejavu_fonts
        ];
      };
    };
  };
}

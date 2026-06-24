# modules/programs/pinta.nix
{
  den.aspects.pinta = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        pinta
      ];
    };
  };
}

# modules/programs/spotify.nix
{ den, ... }: {
  den.aspects.spotify = {
    includes = [ (den.batteries.unfree [ "spotify" ]) ];
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        spotify
      ];
    };
  };
}

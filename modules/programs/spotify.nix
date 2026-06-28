# modules/programs/spotify.nix
_: {
  den.aspects.spotify = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        spotify
      ];
    };
  };
}

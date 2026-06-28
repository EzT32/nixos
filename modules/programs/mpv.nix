# modules/programs/mpv.nix
{
  den.aspects.mpv = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        mpv
      ];
    };
  };
}

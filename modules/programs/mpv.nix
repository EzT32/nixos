# modules/programs/mpv.nix
{
  den.aspects.mpv = {
    homeManager = { pkgs, ... }: {
      programs.mpv = {
        enable = true;
        config = {
          keep-open = "yes";
          loop-file = "inf";
        };
      };
    };
  };
}

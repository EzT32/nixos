# modules/programs/vlc.nix
{
  den.aspects.vlc = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        vlc
      ];
    };
  };
}

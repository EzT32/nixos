# modules/programs/syncplay.nix
{
  den.aspects.syncplay = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        syncplay
      ];
    };
  };
}

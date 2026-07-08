# modules/programs/syncplay.nix
{
  den.aspects.syncplay = {
    provides.to-users = {
      homeManager = { pkgs, ... }: {
        home.packages = with pkgs; [
          syncplay
        ];
      };
    };
  };
}

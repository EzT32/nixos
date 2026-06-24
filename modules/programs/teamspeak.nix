# modules/programs/teamspeak.nix
{ den, ... }: {
  den.aspects.teamspeak = {
    includes = [ (den.batteries.unfree [ "teamspeak6-client" ]) ];
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        teamspeak6-client
      ];
    };
  };
}

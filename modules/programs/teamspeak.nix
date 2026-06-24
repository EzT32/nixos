# modules/programs/teamspeak.nix
{
  den.aspects.teamspeak = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        teamspeak6-client
      ];
    };
  };
}

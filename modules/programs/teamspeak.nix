# modules/programs/teamspeak.nix
_: {
  den.aspects.teamspeak = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        teamspeak6-client
      ];
    };
  };
}

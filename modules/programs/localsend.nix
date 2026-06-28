# modules/programs/localsend.nix
{
  den.aspects.localsend = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        localsend
      ];
    };
  };
}

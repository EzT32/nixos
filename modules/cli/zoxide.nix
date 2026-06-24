# modules/cli/zoxide.nix
{
  den.aspects.zoxide = {
    homeManager = _: {
      programs.zoxide = {
        enable = true;
        options = [ "--cmd cd" ];
      };
    };
  };
}

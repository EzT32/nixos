# modules/cli/zoxide.nix
{
  den.aspects.zoxide = {
    homeManager = {
      programs.zoxide = {
        enable = true;
        options = [ "--cmd cd" ];
      };
    };
  };
}

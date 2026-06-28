# modules/cli/eza.nix
{
  den.aspects.eza = {
    homeManager = {
      programs.eza.enable = true;
    };
  };
}

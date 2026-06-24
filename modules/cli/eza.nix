# modules/cli/eza.nix
{
  den.aspects.eza = {
    homeManager = _: {
      programs.eza.enable = true;
    };
  };
}

# modules/cli/bash.nix
{
  den.aspects.bash = {
    homeManager = _: {
      programs.bash = {
        enable = true;
      };
    };
  };
}

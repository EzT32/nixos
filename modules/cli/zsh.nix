# modules/cli/zsh.nix
{
  den.aspects.zsh = {
    homeManager = _: {
      programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
      };
    };
  };
}

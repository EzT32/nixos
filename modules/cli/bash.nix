# modules/cli/bash.nix
{ den, ... }: {
  den.aspects.bash = {
    includes = with den.aspects; [
      zoxide
      eza
    ];

    homeManager = {
      programs.bash.enable = true;
    };
  };
}

# modules/cli/bash.nix
{ den, ... }: {
  den.aspects.bash = {
    inlcudes = with den.aspects; [
      zoxide
      eza
    ];

    homeManager = {
      programs.bash.enable = true;
    };
  };
}

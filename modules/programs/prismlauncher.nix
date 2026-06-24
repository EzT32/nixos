# modules/programs/prismlauncher.nix
{
  den.aspects.prismlauncher = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        prismlauncher
      ];
    };
  };
}

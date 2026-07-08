# modules/programs/prismlauncher.nix
{
  den.aspects.prismlauncher = {
    provides.to-users = {
      homeManager = { pkgs, ... }: {
        home.packages = with pkgs; [
          prismlauncher
        ];
      };
    };
  };
}

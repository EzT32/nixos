# modules/dev/nvim.nix
{ inputs, ... }:
{
  den.aspects.nvim = {
    homeManager =
      { pkgs, ... }:
      let
        system = pkgs.stdenv.hostPlatform.system;
      in
      {
        home.packages = [
          inputs.nvim-config.packages.${system}.default
        ];
      };
  };
}

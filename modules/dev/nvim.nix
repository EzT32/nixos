# modules/dev/nvim.nix
{ inputs, ... }:
{
  den.aspects.nvim = {
    homeManager =
      { pkgs, host, ... }:
      {
        home.packages = [
          inputs.nvim-config.packages.${host.system}.default
        ];
      };
  };
}

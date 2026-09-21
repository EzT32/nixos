# modules/dev/nvim.nix
{ inputs, ... }:
{
  den.aspects.nvim = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        inputs.nvim-config.packages.${pkgs.system}.default
      ]
      ++ (with pkgs; [ nixfmt ]);
    };

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [ nixfmt-tree ];
    };
  };
}

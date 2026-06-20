# modules/programs/discord.nix
{
  flake.modules.home-manager.discord =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.discord = {

        openASAR = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };

        vencord = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };

      };

      config.home.packages = with pkgs; [
        (discord.override {
          withOpenASAR = config.discord.openASAR;
          withVencord = config.discord.vencord;
        })
      ];
    };
}

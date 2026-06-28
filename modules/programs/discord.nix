# modules/programs/discord.nix
_: {
  den.aspects.discord = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        options.discord = {
          openasar = lib.mkOption {
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
            withOpenASAR = config.discord.openasar;
            withVencord = config.discord.vencord;
          })
        ];
      };
  };
}

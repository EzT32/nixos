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
      let
        cfg = config.discord;
      in
      {
        options.discord = {
          client = lib.mkOption {
            type = lib.types.enum [
              "vesktop"
              "discord"
            ];
            default = "vesktop";
            description = ''
              Which client to install. "vesktop" has Vencord built in and uses
              nixpkgs' Electron. "discord" is the official client, patched with
              the options below.
            '';
          };

          # Only used when client = "discord"
          openasar = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable OpenASAR (only applies when client = \"discord\").";
          };
          vencord = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable Vencord (only applies when client = \"discord\").";
          };
        };

        config.home.packages = [
          (
            if cfg.client == "vesktop" then
              pkgs.vesktop
            else
              pkgs.discord.override {
                withOpenASAR = cfg.openasar;
                withVencord = cfg.vencord;
              }
          )
        ];
      };
  };
}

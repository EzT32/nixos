# modules/programs/blueman.nix
{ den, ... }: {
  den.aspects.blueman = {
    includes = with den.aspects; [ bluetooth ];

    nixos = {
      services.blueman.enable = true;
    };

    provides.to-users = {
      homeManager = { config, lib, ... }: {
        options.blueman.startup = lib.mkEnableOption "Launch blueman on startup";

        config = {
          xdg.configFile."autostart/blueman.desktop".text = ''
            [Desktop Entry]
            Hidden=${lib.boolToString (!config.blueman.startup)}
          '';
        };
      };
    };
  };
}

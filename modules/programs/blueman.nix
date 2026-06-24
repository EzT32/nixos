# modules/programs/blueman.nix
{
  den.aspects.blueman = {
    homeManager = { config, lib, ... }: {
      options.blueman.startup = lib.mkEnableOption "Launch blueman on startup";

      services.blueman.enable = true;
      xdg.configFile."autostart/blueman.desktop".text = ''
        [Desktop Entry]
        Hidden=${lib.boolToString (!config.programs.blueman.startup)}
      '';
    };
  };
}

{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.teamspeak;
in
{
  options.modules.programs.teamspeak = {
    enable = lib.mkEnableOption "Enable teamspeak";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        teamspeak6-client
      ];
    };
  };
}

{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.localsend;
in
{
  options.modules.programs.localsend = {
    enable = lib.mkEnableOption "Enable localsend";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = [
        (pkgs.writeShellScriptBin "localsend" ''
          exec ${pkgs.localsend}/bin/localsend_app "$@"
        '')
        pkgs.localsend
      ];
    };
  };
}

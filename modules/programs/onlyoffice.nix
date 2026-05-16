{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.onlyoffice;
in
{
  options.modules.programs.onlyoffice = {
    enable = lib.mkEnableOption "Enable onlyoffice";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      home.packages = with pkgs; [
        onlyoffice-desktopeditors
      ];
    };
  };
}

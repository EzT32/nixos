{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.lact;
in
{
  options.modules.programs.lact = {
    enable = lib.mkEnableOption "Enable lact";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.lact ];
    systemd.packages = [ pkgs.lact ]; # registers the lactd service unit
    systemd.services.lactd.wantedBy = [ "multi-user.target" ]; # auto-starts it
  };
}

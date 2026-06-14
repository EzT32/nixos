# modules/programs/lact.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.lact;
  enableGroups = config.modules.enableGroups;
in
{
  options.modules.programs.lact = {
    enable = lib.options.mkUnsetOption "Lact";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "amd"
      ] enableGroups)
      {
        environment.systemPackages = [ pkgs.lact ];
        systemd.packages = [ pkgs.lact ]; # registers the lactd service unit
        systemd.services.lactd.wantedBy = [ "multi-user.target" ]; # auto-starts it
      };
}

{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.services.bluetooth;
  enableGroups = config.modules.enableGroups;
in
{
  options.modules.services.bluetooth = {
    enable = lib.options.mkUnsetOption "Hardware bluetooth and bluez";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "bluetooth"
      ] enableGroups)
      {
        hardware.bluetooth = {
          enable = true;
          powerOnBoot = false;

          settings = {
            General = {
              Experimental = true;
              FastConnectable = true;
              Discoverable = false;
              Pairable = false;
            };
          };
        };

        environment.systemPackages = with pkgs; [
          bluez
        ];
      };
}

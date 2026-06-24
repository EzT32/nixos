# modules/services/bluetooth.nix
{
  den.aspects.bluetooth = {
    nixos = { pkgs, ... }: {
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
  };
}

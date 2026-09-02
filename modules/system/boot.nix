# modules/system/boot.nix
{
  den.aspects.boot = {
    nixos = { pkgs, ... }: {
      boot = {
        loader = {
          efi.canTouchEfiVariables = true;

          systemd-boot = {
            enable = true;

            configurationLimit = 5;
          };
        };
        kernelPackages = pkgs.linuxPackages;
        kernelParams = [
          "video=HDMI-A-1:1920x1080@144"
        ];
      };
    };
  };
}

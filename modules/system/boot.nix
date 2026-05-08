{ pkgs, ... }:
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;

        configurationLimit = 5;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "video=HDMI-A-1:1920x1080@144"
      "pcie_aspm=off"
      "amdgpu.runpm=0"
    ];
  };
}

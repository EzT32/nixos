_: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;

        configurationLimit = 5;
      };
    };
    kernelParams = [
      "video=HDMI-A-1:1920x1080@144"
    ];
  };
}

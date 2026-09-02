# modules/programs/lact.nix
{
  den.aspects.lact = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.lact ];
      systemd.packages = [ pkgs.lact ];

      systemd.services.lactd.enable = true;
      systemd.services.lactd.wantedBy = [ "multi-user.target" ];

      systemd.services.lactd.after = [
        "multi-user.target"
        "systemd-udev-settle.service"
      ];
      systemd.services.lactd.wants = [ "systemd-udev-settle.service" ];

      systemd.services.lactd.serviceConfig.Restart = "on-failure";

      hardware.amdgpu.overdrive.enable = true;
    };
  };
}

# modules/programs/lact.nix
{
  den.aspects.lact = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.lact ];
      systemd.packages = [ pkgs.lact ]; # registers the lactd service unit

      systemd.services.lactd.enable = true;
      systemd.services.lactd.wantedBy = [ "multi-user.target" ]; # auto-starts it

      # Wait for udev to finish settling devices (incl. amdgpu's DRM init)
      # before lactd starts, instead of racing it against an early boot target.
      systemd.services.lactd.after = [
        "multi-user.target"
        "systemd-udev-settle.service"
      ];
      systemd.services.lactd.wants = [ "systemd-udev-settle.service" ];

      # Belt-and-suspenders: re-apply LACT's config any time amdgpu's DRM
      # state changes after boot (hotplug, resume, late modeset, etc.)
      # instead of relying on lactd's own internal reload-on-event logic
      # being timed correctly relative to your session/game launch.
      systemd.services.lactd.serviceConfig.Restart = "on-failure";
    };
  };
}

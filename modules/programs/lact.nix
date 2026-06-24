# modules/programs/lact.nix
{
  den.aspects.lact = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.lact ];
      systemd.packages = [ pkgs.lact ]; # registers the lactd service unit
      systemd.services.lactd.wantedBy = [ "multi-user.target" ]; # auto-starts it
    };
  };
}

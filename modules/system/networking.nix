# modules/system/networking.nix
{
  den.aspects.networking = {
    nixos = _: {
      networking.networkmanager.enable = true;
      networking.firewall.enable = true;
    };
  };
}

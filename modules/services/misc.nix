# modules/services/misc.nix
{
  den.aspects.misc = {
    nixos = _: {
      services = {
        printing.enable = true;
        openssh.enable = true;
      };
    };
  };
}

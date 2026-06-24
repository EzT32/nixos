# hosts/laptop/configuration.nix
{
  den,
  ...
}:
{
  den.aspects.laptop = {
    nixos = { ... }: {
      networking.hostName = "laptop";
      imports = [ ./_hardware-configuration.nix ];
    };
  };
}

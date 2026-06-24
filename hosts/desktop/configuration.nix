# hosts/desktop/configuration.nix
{
  den,
  ...
}:
{
  den.aspects.desktop = {
    nixos = { ... }: {
      networking.hostName = "desktop";
      imports = [ ./_hardware-configuration.nix ];
    };

    homeManager = { ... }: {
      discord.vencord = false;
    };

    # List aspects to include
    includes = [
      den.aspects.discord
    ];
  };
}

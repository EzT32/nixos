# modules/programs/onlyoffice.nix
{
  den.aspects.onlyoffice = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        onlyoffice-desktopeditors
      ];
    };
  };
}

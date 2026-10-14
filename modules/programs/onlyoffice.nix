# modules/programs/onlyoffice.nix
{
  den.aspects.onlyoffice = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        onlyoffice-desktopeditors
      ];
    };

    nixos = { pkgs, ... }: {
      systemd.tmpfiles.rules = [
        "d /home/ezt/.local/share/fonts 0755 ezt users -"
        "C /home/ezt/.local/share/fonts/${pkgs.stix-two.name} - ezt users - ${pkgs.stix-two}/share/fonts/opentype"
        "C /home/ezt/.local/share/fonts/${pkgs.libertinus.name} - ezt users - ${pkgs.libertinus}/share/fonts/opentype"
        "C /home/ezt/.local/share/fonts/${pkgs.lmmath.name} - ezt users - ${pkgs.lmmath}/share/fonts/opentype"
      ];
    };
  };
}

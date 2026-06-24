# modules/desktop/dolphin.nix
{
  den.aspects.dolphin = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        kdePackages.dolphin
        kdePackages.qtsvg
      ];
    };
  };
}

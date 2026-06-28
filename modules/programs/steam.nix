# modules/programs/steam.nix
_: {
  den.aspects.steam = {
    nixos = { pkgs, ... }: {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        extest.enable = true;

        package = pkgs.steam.override {
          extraEnv = {
            MANGOHUD = "1";
            STEAM_SCALE = "0.75";
          };
          extraPkgs = pkgs: [ pkgs.mangohud ];
        };

        extraCompatPackages = with pkgs; [ proton-ge-bin ];
      };
    };
  };
}

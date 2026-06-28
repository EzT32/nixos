# modules/system/nix.nix
{
  den.aspects.nix = {
    nixos = _: {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nix.channel.enable = false;
      nix.settings.auto-optimise-store = true;
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };
  };
}

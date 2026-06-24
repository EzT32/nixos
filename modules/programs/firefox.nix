# modules/programs/firefox.nix
{
  den.aspects.firefox = {
    homeManager = _: {
      programs.firefox = {
        enable = true;
        profiles.default = {
          settings = {
            "media.default_volume" = "0.5";
          };
        };
      };
    };
  };
}

# modules/desktop/rofi.nix
{
  den.aspects.rofi = {
    homeManager = _: {
      programs.rofi = {
        enable = true;

        theme = "gruvbox-dark";

        extraConfig = {
          show-icons = true;
          icon-theme = "breeze";
          drun-display-format = "{name} {icon}";
        };
      };
    };
  };
}

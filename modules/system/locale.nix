# modules/system/locale.nix
{
  den.aspects.locale = {
    nixos = _: {
      time.timeZone = "Europe/Oslo";
      # Select internationalisation properties.
      i18n.defaultLocale = "en_US.UTF-8";

      console = {
        keyMap = "no";
      };
    };
  };
}

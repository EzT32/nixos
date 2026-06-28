# modules/services/sddm.nix
{
  den.aspects.sddm = {
    nixos = _: {
      services = {
        xserver.enable = true;
        displayManager.sddm = {
          enable = true;
        };
      };

      services.xserver.xkb = {
        layout = "no";
        variant = "";
      };

      services.gnome.gnome-keyring.enable = true;
      services.udisks2.enable = true;
    };
  };
}

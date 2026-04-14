{ pkgs, ... }:
{
  services = {
    xserver.enable = true;
    displayManager.sddm = {
      enable = true;
    };
    #theme = "Gruvbox";
  };

  #environment.systemPackages = [
  #  (pkgs.stdenv.mkDerivation {
  #    pname = "sddm-theme-gruvbox";
  #    version = "1.0";
  #    src = pkgs.lib.cleanSource ./themes/Gruvbox;
  #    installPhase = ''
  #      mkdir -p $out/share/sddm/themes/Gruvbox
  #      cp -r $src/* $out/share/sddm/themes/Gruvbox/
  #    '';
  #  })
  #];

  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  services.gnome.gnome-keyring.enable = true;
  services.udisks2.enable = true;
}

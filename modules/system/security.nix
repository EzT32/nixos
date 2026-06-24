# modules/system/security.nix
{
  den.aspects.security = {
    nixos = _: {
      security = {
        rtkit.enable = true;
        pam.services.gdm-password.enableGnomeKeyring = true;
        sudo.extraConfig = "Defaults timestamp_timeout=15";
      };
      programs.gnupg.agent.enable = true;
    };
  };
}

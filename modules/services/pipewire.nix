# modules/services/pipewire.nix
{
  den.aspects.pipewire = {
    nixos = _: {
      services.pipewire = {
        enable = true;
        audio.enable = true;
        pulse.enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        wireplumber = {
          enable = true;
          extraConfig.razer-blackshark-audio."monitor.alsa.rules" = [
            {
              matches = [
                { "device.name" = "~alsa_card.usb-1532_Razer_BlackShark_V2_Pro_2.4.*"; }
              ];
              actions.update-props."device.profile" = "output:iec958-stereo+input:mono-fallback";
            }
          ];
        };
      };

      environment.etc."wireplumber/wireplumber.conf.d/firefox-volume.conf".text = ''
        stream.rules = [
          {
            matches = [ { node.name = "Firefox" } ]
            actions = {
              modify-props = {
                node.volume = 0.3
              }
            }
          }
        ]
      '';
    };
  };
}

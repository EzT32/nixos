# modules/programs/obs.nix
{
  den.aspects.obs = {
    homeManager = { pkgs, ... }: {
      programs.obs-studio = {
        enable = true;

        plugins = with pkgs.obs-studio-plugins; [
          obs-pipewire-audio-capture
        ];
      };
    };
  };
}

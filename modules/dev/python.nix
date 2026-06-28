# modules/dev/python.nix
{
  den.aspects.python = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        (python3.withPackages (
          python-pkgs: with python-pkgs; [
            evdev
            pyaml
            numpy
            black
            matplotlib
          ]
        ))
        pandoc
        texliveFull
      ];
    };
  };
}

# modules/dev/python.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.dev.python;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.dev.python = {
    enable = lib.options.mkUnsetOption "Python";
  };

  config = lib.mkIf (lib.modules.isEnabled cfg.enable [ "dev" ] enableGroups) {

    home-manager.users.${user.username} = {
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

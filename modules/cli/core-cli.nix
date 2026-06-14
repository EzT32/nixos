# modules/cli/core-cli.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  enableGroups = config.modules.enableGroups;
in
{
  config =
    lib.mkIf
      (lib.modules.inGroups [
        "programs"
        "dev"
        "cli"
      ] enableGroups)
      {

        environment.systemPackages = with pkgs; [
          curl
          evtest
          htop
          jq
          libinput
          lsof
          parted
          pwvucontrol
          strace
          unzip
          vim
          wget
          zip
          imagemagick
          inkscape
          aria2
          alsa-utils
          wlr-randr
        ];
      };
}

# modules/dev/java.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.dev.java;
  enableGroups = config.modules.enableGroups;
in
{
  options.modules.dev.java = {
    enable = lib.options.mkUnsetOption "Java";
  };

  config = lib.mkIf (lib.modules.isEnabled cfg.enable [ "dev" ] enableGroups) {

    environment.systemPackages = with pkgs; [
      javaPackages.compiler.openjdk25
    ];
  };
}

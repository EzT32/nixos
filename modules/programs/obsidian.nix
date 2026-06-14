# modules/programs/obsidian.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.obsidian;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.obsidian = {
    enable = lib.mkUnsetOption "Custom module for Obsidian";

    vaultPath = lib.mkOption {
      type = lib.types.path;
      default = "${config.home.homeDirectory}/Notes";
    };
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "programs"
        "work"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          home.packages = with pkgs; [
            obsidian
          ];
        };
      };
}

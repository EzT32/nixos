# modules/programs/prismlauncher.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.prismlauncher;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.programs.prismlauncher = {
    enable = lib.options.mkUnsetOption "Prismlauncher";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "programs"
        "gaming"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          home.packages = with pkgs; [
            prismlauncher
          ];
        };
      };
}

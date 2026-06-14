# modules/cli/bash.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.cli.bash;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.cli.bash = {
    enable = lib.mkUnsetOption "Bash";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "cli"
      ] enableGroups)
      {
        home-manager.users.${user.username} = {
          programs.bash = {
            enable = true;

            initExtra = ''
              [[ -f ~/.profile ]] && . ~/.profile
            '';
          };
        };
      };
}

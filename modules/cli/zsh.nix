# modules/cli/zsh.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.cli.zsh;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.cli.zsh = {
    enable = lib.mkUnsetOption "Zsh";
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "cli"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          programs.zsh = {
            enable = true;

            autosuggestion.enable = true;
            enableCompletion = true;
            sessionVariables = {
              EDITOR = "nvim";
            };
          };
        };
      };
}

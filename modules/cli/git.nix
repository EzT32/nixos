# modules/cli/git.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.cli.git;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.cli.git = {
    enable = lib.mkUnsetOption "Custom module for git";

    userName = lib.mkOption {
      type = lib.types.str;
      example = "Username";
    };

    userEmail = lib.mkOption {
      type = lib.types.str;
      example = "username@gmail.com";
    };
  };

  config =
    lib.mkIf
      (lib.modules.isEnabled cfg.enable [
        "cli"
        "dev"
      ] enableGroups)
      {

        home-manager.users.${user.username} = {
          programs.git = {
            enable = true;
            package = pkgs.gitFull;

            settings = {
              user = {
                name = cfg.userName;
                email = cfg.userEmail;
              };
              credential.helper = "libsecret";
            };
          };

          home.packages = with pkgs; [
            libsecret
          ];
        };
      };
}

# modules/cli/git.nix
{
  den.aspects.git = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        options.git = {
          userName = lib.mkOption {
            type = lib.types.str;
            example = "Username";
          };

          userEmail = lib.mkOption {
            type = lib.types.str;
            example = "username@gmail.com";
          };
        };

        programs.git = {
          enable = true;
          package = pkgs.gitFull;

          settings = {
            user = {
              name = config.git.userName;
              email = config.git.userEmail;
            };
            credential.helper = "libsecret";
          };

          home.packages = with pkgs; [
            libsecret
          ];
        };
      };
  };
}

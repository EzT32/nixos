{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.ssh;
in
{
  options.modules.programs.ssh = {
    enable = lib.mkEnableOption "Enable ssh configurations.";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      services.ssh-agent.enable = true;
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;

        settings = {
          "uio" = {
            host = "uio";
            hostname = "login.uio.no";
            user = "theodobe";
            forwardX11 = true;
            forwardX11Trusted = true;
            compression = true;
          };
          "ifi" = {
            host = "ifi";
            hostname = "login.ifi.uio.no";
            user = "theodobe";
            forwardX11 = true;
            forwardX11Trusted = true;
            compression = true;
            proxyJump = "uio";
          };

          "github-uio" = {
            host = "github.uio.no";
            hostname = "github.uio.no";
            user = "git";
            identityFile = "~/.ssh/id_ed25519_theodobe";
            identitiesOnly = true;
          };

          "github-ezt" = {
            host = "github.com";
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/id_ed25519_ezt32";
            identitiesOnly = true;
          };
        };
      };
    };

    environment.systemPackages = [
      pkgs.xauth
      pkgs.sshfs
    ];
  };
}

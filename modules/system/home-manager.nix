# modules/system/home-manager.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.system.home-manager;
  user = config.modules.system.user;
in
{
  options.modules.system.home-manager = {
    enable = lib.mkEnableOption "Enable home-manager configurations.";
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      useGlobalPkgs = true; # use system config's package set (nixpkgs)
      useUserPackages = true; # allow user-specific packages through NixOS user configuration
      users.${user.username} = {
        home = {
          stateVersion = config.system.stateVersion;
          username = user.username;
          homeDirectory = user.homeDir;
        };
      };
    };
  };
}

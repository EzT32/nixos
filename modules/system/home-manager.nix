# modules/system/home-manager.nix
{
  config,
  ...
}:
let
  user = config.modules.system.user;
in
{
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
}

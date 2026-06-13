# modules/system/user.nix
{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.system.user;
in
{
  options.modules.system.user = {
    username = lib.mkOption { type = lib.types.str; };

    # defaults to `/home/<username>` -> not have to be set unless of non-standard home path.
    homeDir = lib.mkOption {
      type = lib.types.str;
      default = "/home/${cfg.username}";
    };
  };
}

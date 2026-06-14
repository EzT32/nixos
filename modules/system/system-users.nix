# modules/system/system-users.nix
{
  config,
  ...
}:
let
  user = config.modules.system.user;
in
{
  users.users.${user.username} = {
    isNormalUser = true;

    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
  };
}

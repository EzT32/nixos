# modules/users.nix
{ den, ... }:
{
  den.aspects.ezt = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
    ];

    homeManager = {
      git.userName = "EzT32";
      git.userEmail = "theodor.berghansen@icloud.com";
    };

    user = {
      extraGroups = [ "video" ];
    };
  };
}

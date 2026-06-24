# modules/programs/obsidian.nix
{ den, ... }:
{
  den.aspects.obsidian = {
    includes = [ (den.batteries.unfree [ "obsidian" ]) ];
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        options.obsidian = {
          vaultPath = lib.mkOption {
            type = lib.types.path;
            default = "${config.home.homeDirectory}/Notes";
          };
        };

        config.home.packages = with pkgs; [
          obsidian
        ];
      };
  };
}

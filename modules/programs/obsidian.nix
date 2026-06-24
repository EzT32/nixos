# modules/programs/obsidian.nix
{
  den.aspects.obsidian = {
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        options.obsidian.vaultPath = {
          vaultPath = lib.mkOption {
            type = lib.types.path;
            default = "${config.home.homeDirectory}/Notes";
          };
        };

        home.packages = with pkgs; [
          obsidian
        ];
      };
  };
}

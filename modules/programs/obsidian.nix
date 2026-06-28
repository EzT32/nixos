# modules/programs/obsidian.nix
_: {
  den.aspects.obsidian = {
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

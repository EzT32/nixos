# hosts/defaults.nix
{
  den.defaults = {
    nixos = {
      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "26.05";
    };

    homeManager = {
      home.stateVersion = "26.05";
    };
  };
}

# hosts/desktop.nix
{
  inputs,
  ...
}:
let
  lib = (import ../lib/lib.nix) inputs.nixpkgs.lib;
in
{
  # What nixos-rebuild looks at when doing `nixos-rebuild switch --flake .#desktop`.
  # `nixosSystem` – defines the NixOS system configuration.
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    inherit lib;

    # List NixOS modules that should be merged together to form the final system configuration.
    modules = [
      { networking.hostName = "desktop"; } # what module preset-file to import based on hostName.
      inputs.home-manager.nixosModules.home-manager # default module to declare home-manager options.
      (inputs.import-tree ../modules) # custom modules collected by import-tree
    ];

    # Extra values into every module file referenced by the configuration –
    # making them available as additional arguments like `{ config, lib, ...}`.
    specialArgs = { inherit inputs; };
  };
}

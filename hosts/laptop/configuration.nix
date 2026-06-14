# hosts/laptop/configuration.nix
{
  inputs,
  self,
  ...
}:
let
  lib = (import ../../lib/lib.nix) inputs.nixpkgs.lib;
in
{
  # What nixos-rebuild looks at when doing `nixos-rebuild switch --flake .#desktop`.
  # `nixosSystem` – defines the NixOS system configuration.
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    inherit lib;

    # List NixOS modules that should be merged together to form the final system configuration.
    modules = [
      { networking.hostName = "laptop"; } # what module preset-file to import based on hostName.
      ./_hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager # default module to declare home-manager options.
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd # laptop specific modules
      (inputs.import-tree ../../modules) # custom modules collected by import-tree
      (inputs.import-tree ../../overlays)
    ];

    # Extra values into every module file referenced by the configuration –
    # making them available as additional arguments like `{ config, lib, ...}`.
    specialArgs = { inherit inputs self; };
  };
}

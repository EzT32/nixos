# hosts/desktop/configuration.nix
{
  inputs,
  ...
}:
{
  # What nixos-rebuild looks at when doing `nixos-rebuild switch --flake .#desktop`.
  # `nixosSystem` – defines the NixOS system configuration.
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      { networking.hostName = "desktop"; }

      # Default module to declare home-manager options.
      inputs.home-manager.nixosModules.home-manager

      # Host-specific hardware file.
      ./_hardware-configuration.nix

      # Module classes
      ./_classes/nixos.nix
      ./_classes/home-manager.nix
    ];

    # Extra values into every module file referenced by the configuration –
    # making them available as additional arguments like `{ config, lib, ...}`.
    specialArgs = { inherit inputs; };
  };
}

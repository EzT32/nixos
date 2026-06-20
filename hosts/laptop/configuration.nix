# hosts/laptop/configuration.nix
{
  config,
  inputs,
  ...
}:
let
  username = "ezt";
in
{
  # What nixos-rebuild looks at when doing `nixos-rebuild switch --flake .#desktop`.
  # `nixosSystem` – defines the NixOS system configuration.
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      { networking.hostName = "laptop"; }

      # Default module to declare home-manager options.
      inputs.home-manager.nixosModules.home-manager

      # Host-specific hardware file
      ./_hardware-configuration.nix

      # NixOS class aspects this host wants.
      # Include aspects from the shared tree/namespace.
      # Anything not listed will not be part of the host.
      {
        home-manager.users.${username} = {
          imports = with config.flake.modules.homeManager; [
            # TODO: add aspects here once refactor is complete.
            firefox
          ];
        };

        home.stateVersion = "26.05";
      }

    ];

    # Extra values into every module file referenced by the configuration –
    # making them available as additional arguments like `{ config, lib, ...}`.
    specialArgs = { inherit inputs; };
  };
}

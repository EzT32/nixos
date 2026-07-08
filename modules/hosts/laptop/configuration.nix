# modules/hosts/laptop/configuration.nix
{ den, inputs, ... }:
{
  den.aspects.laptop = {
    nixos = {
      networking.hostName = "laptop";
      imports = [
        ./_hardware-configuration.nix
        inputs.nixos-hardware.nixosModules.lenovo-thinkpad-e14-amd
      ];
    };
    provides.to-users = {
      homeManager = {
        cursor.size = 20;
      };
    };

    includes = with den.aspects; [
      hyprland-laptop-binds
      blueman
      obsidian
      steam
    ];
  };
}

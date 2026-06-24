# hosts/desktop/configuration.nix
{ den, ... }:
{
  den.aspects.desktop = {
    nixos = { ... }: {
      networking.hostName = "desktop";
      imports = [ ./_hardware-configuration.nix ];
    };

    includes = with den.aspects; [
      discord
      hyprland
      wooting
      steam
      lact
      prismlauncher
      syncplay
    ];
  };
}

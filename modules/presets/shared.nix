# modules/presets/shared.nix
_: {
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";

  modules = {
    system.user.username = "ezt";

    enableGroups = [
      "cli"
      "desktop"
      "hyprland"
      "hyprland-binds"
      "dev"
      "fonts"
      "services"
      "media"
      "communication"
    ];

    services.bluetooth.enable = true;

    cli.git = {
      enable = true;
      userName = "EzT32";
      userEmail = "theodor.berghansen@icloud.com";
    };
  };
}

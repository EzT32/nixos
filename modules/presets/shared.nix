# modules/presets/shared.nix
_: {
  nixpkgs.config.allowUnfree = true;

  programs.firefox = {
    enable = true;
    preferences = {
      "media.default_volume" = "0.5";
    };
  };

  system.stateVersion = "26.05";

  modules = {
    system = {
      user.username = "ezt";
      home-manager.enable = true;
    };

    enableGroups = [
      "cli"
      "desktop"
      "dev"
      "fonts"
      "programs"
      "services"
    ];

    desktop.hyprland = {
      hyprlock.enable = false;
      hypridle.enable = false;

      hyprland.keybinds.laptop = false;

      hyprpaper = {
        enable = true;
        wallpaper = "Scatter_gruvbox.png";
      };
    };

    cli.git = {
      enable = true;
      userName = "EzT32";
      userEmail = "theodor.berghansen@icloud.com";
    };

    programs = {
      ssh.enable = true;
    };
  };
}

_: {
  nixpkgs.config.allowUnfree = true;
  programs.firefox = {
    enable = true;
    preferences = {
      "media.default_volume" = "0.5";
    };
  };

  system.stateVersion = "25.11";

  modules = {
    kitty.enable = true;
    nvim.enable = true;
    rofi.enable = true;
    system.home-manager.enable = true;

    desktop = {
      cursor.enable = true;
      dolphin.enable = true;

      hyprland = {
        enable = true;

        hyprpaper.enable = true;
        hyprsunset.enable = true;

        keybinds = {
          launchers.enable = true;
          media.enable = true;
          mouse.enable = true;
          window.enable = true;
          workspace.enable = true;
        };
      };
    };

    git = {
      enable = true;

      userName = "EzT32";
      userEmail = "theodor.berghansen@icloud.com";
    };

    programs = {
      discord.enable = true;
      mpv.enable = true;
      spotify.enable = true;
      ssh.enable = true;
    };

    services = {
      bluetooth.enable = true;
    };

    shell = {
      bash.enable = true;
      eza.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };
  };
}

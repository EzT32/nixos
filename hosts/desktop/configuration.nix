_: {
  networking.hostName = "desktop";

  modules = {
    desktop = {
      hyprland.sensitivity = -0.5;
    };
    programs = {
      prismlauncher.enable = true;
      syncplay.enable = true;
      libreoffice.enable = true;
      steam.enable = true;
      pinta.enable = true;
      vscode.enable = true;
      obsidian.enable = true;
      teamspeak.enable = true;
    };
  };
}

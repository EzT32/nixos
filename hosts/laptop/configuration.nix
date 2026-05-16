_: {
  networking.hostName = "laptop";

  modules = {
    desktop = {
      hyprland = {
        keybinds.laptop.enable = true;
      };

      cursor.size = 24;
    };

    programs = {
      obsidian.enable = true;
      blueman.enable = true;
      vscode.enable = true;
    };
  };
}

{ config, ... }:
{
  networking.hostName = "desktop";

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = false;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

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
    };
  };
}

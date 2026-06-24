# hosts/defaults.nix
{ den, ... }:
{
  den.default = {
    nixos = _: {
      system.stateVersion = "26.05";
      home-manager.useGlobalPkgs = true;

      environment.sessionVariables = {
        nixos_ozone_wl = "1";
        gdk_scale = "1.5";
        qt_scale_factor = "1";

        wlr_no_hardware_cursors = "1";
        editor = "nvim";
      };
    };

    homeManager = _: {
      home.stateVersion = "26.05";

      git.userName = "EzT32";
      git.userEmail = "theodor.berghansen@icloud.com";
    };

    includes = with den.aspects; [
      hyprland
      nix
      locale
      fonts
      security
      clipboard
      networking
      boot
      pipewire
      sddm
      bluetooth
      bash
      zsh
      git
      core-cli
      zoxide
      eza
      ssh
      firefox
      discord
      python
      java
      nvim
      onlyoffice
      spotify
      vlc
      mpv
      pinta
      kitty
      localsend
      misc
      cursor
      dolphin
      rofi
      xdg
    ];
  };
}

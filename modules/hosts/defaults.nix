# modules/hosts/defaults.nix
{ den, ... }: {
  den.default = {
    nixos = {
      system.stateVersion = "26.05";
      home-manager.useGlobalPkgs = true;
      nixpkgs.config.allowUnfree = true;
    };

    homeManager = {
      home.stateVersion = "26.05";
      home.sessionVariables.EDITOR = "nvim";
    };

    includes = with den.aspects; [
      den.batteries.host-aspects

      # cli
      bash
      core-cli
      eza
      git
      ssh
      zoxide

      # dev
      java
      nvim
      python
      vscode

      # gui
      cursor
      dolphin
      hyprland
      rofi
      waybar
      xdg

      # programs
      firefox
      mpv
      obs
      onlyoffice
      discord
      kitty
      localsend
      pinta
      spotify
      vlc

      # services
      bluetooth
      misc
      pipewire
      sddm

      #system
      boot
      fonts
      networking
      security
      clipboard
      locale
      nix
    ];
  };
}

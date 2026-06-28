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
      waybar
    ];
  };
}

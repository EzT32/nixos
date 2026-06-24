# hosts/defaults.nix
{ den, ... }:
{
  den.default = {
    nixos = { ... }: {
      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "26.05";
      environment.sessionvariables = {
        nixos_ozone_wl = "1";
        gdk_scale = "1.5";
        qt_scale_factor = "1";

        wlr_no_hardware_cursors = "1";
        editor = "nvim";
      };
    };

    homeManager = { ... }: {
      home.stateVersion = "26.05";
    };

    includes = with den.aspects; [
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
      vscode
      python
      java
      nvim
      onlyoffice
      teamspeak
      spotify
      obsidian
      vlc
      mpv
      pinta
      kitty
      localsend
      misc
    ];
  };
}

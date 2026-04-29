{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.programs.vscode;

  pythonEnv = pkgs.vscode.fhsWithPackages (p: [
    (p.python3.withPackages (
      ps: with ps; [
        pip
        ipykernel
        jupyter
        notebook

        # IN1160
        numpy
        matplotlib
        pandas
        ipykernel
        scikit-learn
        seaborn
        pyyaml
        ipython
        plotly
        gymnasium
        pygame
        datasets
        pkgs.openml
      ]
    ))
  ]);

in
{
  options.modules.programs.vscode = {
    enable = lib.mkEnableOption "Enable vscode";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.ezt = {
      programs.vscode = {
        enable = true;
        package = pythonEnv;
        mutableExtensionsDir = false;

        profiles.default = {
          userSettings = {
            # Formatting
            "editor.formatOnSave" = true;
            "[python]" = {
              "editor.defaultFormatter" = "charliermarsh.ruff";
            };

            "python.defaultInterpreterPath" = "usr/bin/python";

            # Ricing
            "workbench.colorTheme" = "Gruvbox Dark Medium";

            # LSP
            "python.languageServer" = "Pylance";

            # Wordwrap
            "editor.wordWrap" = "on";

            # AI slop
            "chat.agent.enabled" = false;
            "chat.disableAIFeatures" = true;

            "extensions.autoUpdate" = false;
            "extensions.autoCheckUpdates" = false;

            "extensions.verifySignature" = false;

            "workbench.startupEditor" = "none";
          };

          extensions = with pkgs.vscode-extensions; [
            ms-python.python
            charliermarsh.ruff
            ms-python.vscode-pylance
            ms-toolsai.jupyter
            ms-vscode.live-server
            ms-vsliveshare.vsliveshare
            ms-python.debugpy

            # Colortheme
            jdinhlife.gruvbox
            pkief.material-icon-theme

            # Docstrings
            njpwerner.autodocstring

            tomoki1207.pdf
          ];
        };
      };
    };
  };
}

# modules/dev/nvim/nvim.nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.dev.nvim;
  enableGroups = config.modules.enableGroups;
  user = config.modules.system.user;
in
{
  options.modules.dev.nvim = {
    enable = lib.options.mkUnsetOption "Neovim";
  };

  config = lib.mkIf (lib.modules.isEnabled cfg.enable [ "dev" ] enableGroups) {

    home-manager.users.${user.username} = {
      programs.neovim = {
        enable = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        extraPackages = with pkgs; [
          lua-language-server
          stylua
          luaPackages.luacheck

          nil
          statix

          wl-clipboard

          vhdl-ls
          ghdl
          vsg

          asm-lsp
          asmfmt

          pyright
          black

          clang-tools

          jdt-language-server
        ];

        plugins = with pkgs.vimPlugins; [
          nvim-lspconfig
          (nvim-treesitter.withPlugins (
            p: with p; [
              lua
              nix
              bash
              vhdl
              asm
              python
              c
              java
            ]
          ))

          telescope-nvim
          plenary-nvim

          neodev-nvim

          gruvbox-nvim
          lualine-nvim

          indent-blankline-nvim
          comment-nvim

          conform-nvim

          nvim-cmp
          cmp-nvim-lsp
          cmp-buffer
          cmp-path
          luasnip
          cmp_luasnip
        ];
      };

      home.packages = with pkgs; [
        nixfmt
      ];

      xdg.configFile."nvim/init.lua".source = ./init.lua;
      xdg.configFile."nvim/lua".source = ./lua;
    };

    # TODO: add support for more filetypes
    environment.systemPackages = with pkgs; [
      nixfmt-tree
    ];
  };
}

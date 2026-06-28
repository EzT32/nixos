# modules/dev/nvim/nvim.nix
{
  den.aspects.nvim = {
    homeManager = { pkgs, ... }: {
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

    nixos = { pkgs, ... }: {
      # TODO: add support for more filetypes
      environment.systemPackages = with pkgs; [
        nixfmt-tree
      ];
    };
  };
}

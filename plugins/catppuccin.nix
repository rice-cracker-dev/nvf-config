{lib, ...}: let
  inherit (lib.nvim.dag) entryAnywhere;
in {
  config.vim = {
    startPlugins = ["catppuccin"];

    pluginRC.catppuccin-nvim = entryAnywhere ''
      require('catppuccin').setup {
        flavour = "macchiato",
        transparent_background = true,
        term_colors = true,

        float = {
          transparent = false, -- enable transparent floating windows
          solid = true, -- use solid styling for floating windows, see |winborder|
        },

        integrations = {
          nvimtree = {
            enabled = true,
            transparent_panel = true,
            show_root = true,
          },

          hop = true,
          gitsigns = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          ts_rainbow = true,
          fidget = true,
          alpha = true,
          leap = true,
          lsp_saga = true,
          markdown = true,
          noice = true,
          notify = true, -- nvim-notify
          which_key = true,
          navic = {
            enabled = true,
            custom_bg = "NONE", -- "lualine" will set background to mantle
          },
        },

        custom_highlights = function(colors)
          return {
            YaziFloat = { bg = colors.mantle },
          }
        end
      }

      -- setup must be called before loading
      vim.cmd.colorscheme "catppuccin"
    '';
  };
}

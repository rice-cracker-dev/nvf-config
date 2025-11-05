{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
      setupOpts = {
        direction = "float";
        float_opts.border = "solid";

        highlights = {
          Normal.guibg = mkLuaInline "require('catppuccin.palettes').get_palette().base";
          NormalFloat.guibg = mkLuaInline "require('catppuccin.palettes').get_palette().mantle";
        };
      };
    };

    keymaps = [
      {
        key = "<esc>";
        mode = "t";
        action = "<C-\\><C-n>";
        noremap = false;
      }
    ];
  };
}

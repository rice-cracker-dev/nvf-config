{lib, ...}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim.tabline.nvimBufferline = {
    enable = true;
    mappings = {
      cycleNext = "<c-tab>";
      cyclePrevious = "<cs-tab>";
    };

    setupOpts.highlights = mkLuaInline ''
      (function()
        local integration = require("catppuccin.special.bufferline")
        return (integration.get_theme or integration.get)()
      end)()
    '';
  };
}

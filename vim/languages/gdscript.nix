{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      gdscript
    ];

    lsp.servers.gdscript = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "attach_keymaps";
    };
  };
}

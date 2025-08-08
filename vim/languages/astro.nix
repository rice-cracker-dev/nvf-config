{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      astro
    ];

    lsp.servers.astro = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "attach_keymaps";
      cmd = ["${pkgs.astro-language-server}/bin/astro-ls" "--stdio"];
    };
  };
}

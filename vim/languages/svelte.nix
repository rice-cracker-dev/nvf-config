{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      svelte
    ];

    lsp.servers.svelte = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "default_on_attach";
      cmd = ["${pkgs.svelte-language-server}/bin/svelteserver" "--stdio"];
    };
  };
}

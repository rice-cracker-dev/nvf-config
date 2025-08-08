{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      css
      scss
      less
      sass
    ];

    lsp.servers.tailwindcss = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "default_on_attach";
      cmd = ["${pkgs.tailwindcss-language-server}/bin/tailwindcss-language-server" "--stdio"];
    };
  };
}

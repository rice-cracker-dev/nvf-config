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
    ];

    lsp.servers = {
      cssls = {
        capabilities = mkLuaInline "capabilities";
        on_attach = mkLuaInline "default_on_attach";
        cmd = ["${pkgs.vscode-css-languageserver}/bin/vscode-css-languageserver" "--stdio"];
        settings = {
          css.lint.unknownAtRules = "ignore";
        };
      };

      tailwindcss = {
        capabilities = mkLuaInline "capabilities";
        on_attach = mkLuaInline "default_on_attach";
        cmd = ["${pkgs.tailwindcss-language-server}/bin/tailwindcss-language-server" "--stdio"];
      };
    };
  };
}

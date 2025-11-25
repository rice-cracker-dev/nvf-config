{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      typescript
      tsx
      javascript
      jsdoc
    ];

    lsp.servers.ts_ls = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "default_on_attach";
      cmd = ["${pkgs.typescript-language-server}/bin/typescript-language-server" "--stdio"];
      settings.preferences.quotePreference = "single";
    };
  };
}

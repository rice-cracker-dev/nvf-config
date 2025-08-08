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
      javascript
      jsdoc
    ];

    lsp.servers.ts_ls = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline ''
        function(client, bufnr)
          attach_keymaps(client, bufnr);
          client.server_capabilities.documentFormattingProvider = false;
        end
      '';
      cmd = ["${pkgs.typescript-language-server}/bin/typescript-language-server" "--stdio"];
    };
  };
}

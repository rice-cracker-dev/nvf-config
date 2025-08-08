{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      json
      jsonc
    ];

    lsp.servers.jsonls = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "default_on_attach";

      cmd = [
        "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server"
        "--stdio"
      ];

      settings = {
        json = {
          schemas = mkLuaInline ''
            require("schemastore").json.schemas()
          '';
          validate = {enable = true;};
        };
      };
    };
  };
}

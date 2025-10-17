{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      yaml
    ];

    lsp.servers.yamlls = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "default_on_attach";

      cmd = [
        "${pkgs.yaml-language-server}/bin/yaml-language-server"
        "--stdio"
      ];

      settings = {
        yaml = {
          validate = {enable = true;};

          schemaStore = {
            enable = false;
            url = "";
          };

          schemas = mkLuaInline ''
            require("schemastore").yaml.schemas()
          '';
        };
      };
    };
  };
}

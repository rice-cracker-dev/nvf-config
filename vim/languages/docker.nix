{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      dockerfile
    ];

    lsp.servers.docker_language_server = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline "default_on_attach";
      cmd = ["${pkgs.docker-language-server}/bin/docker-language-server" "start" "--stdio"];
    };
  };
}

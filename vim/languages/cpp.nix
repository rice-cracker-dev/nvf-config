{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      c
      cpp
    ];

    lsp.servers.clangd = {
      capabilities = mkLuaInline "capabilities";
      on_attach = mkLuaInline ''
        function(client, bufnr)
          vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
            switch_source_header(bufnr)
          end, { desc = 'Switch between source/header' })

          vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdShowSymbolInfo', function()
            symbol_info()
          end, { desc = 'Show symbol info' })

          default_on_attach(client, bufnr)
        end
      '';
      cmd = ["${pkgs.clang-tools}/bin/clangd"];
    };
  };
}

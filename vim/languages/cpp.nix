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

    overseer.templates = [
      {
        name = "clang++ build (debug)";
        builder = mkLuaInline ''
          function()
            local vars = require("overseer.template.vscode.variables").precalculate_vars()

            return {
              cmd = { "clang++" },
              args = {
                "-std=c++20",
                "-glldb",
                "-fstandalone-debug",
                vars.relativeFile,
                "-o", vars.fileBasenameNoExtension
              },
              components = { { "on_output_quickfix", open = true }, "default" },
            }
          end
        '';
        condition = {
          filetype = ["cpp"];
        };
      }
      {
        name = "clang++ clean (debug)";
        builder = mkLuaInline ''
          function()
            local vars = require("overseer.template.vscode.variables").precalculate_vars()

            return {
              cmd = { "rm" },
              args = { vars.fileBasenameNoExtension }
            }
          end
        '';
        condition = {
          filetype = ["cpp"];
        };
      }
    ];
  };
}

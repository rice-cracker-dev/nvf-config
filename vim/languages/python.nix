{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      python
    ];

    lsp.servers.basedpyright = {
      cmd = ["${pkgs.basedpyright}/bin/basedpyright-langserver" "--stdio"];
      capabilities = mkLuaInline "capabilities";

      on_attach = mkLuaInline ''
        function(client, bufnr)
          vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
            client:exec_cmd({
              command = 'basedpyright.organizeimports',
              arguments = { vim.uri_from_bufnr(bufnr) },
            })
          end, {
            desc = 'Organize Imports',
          })

          vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', set_python_path, {
            desc = 'Reconfigure basedpyright with the provided python path',
            nargs = 1,
            complete = 'file',
          })

          default_on_attach(client, bufnr)
        end
      '';
    };
  };
}

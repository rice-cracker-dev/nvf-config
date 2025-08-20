{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      svelte
    ];

    lsp.servers.svelte = {
      capabilities = mkLuaInline "capabilities";
      cmd = ["${pkgs.svelte-language-server}/bin/svelteserver" "--stdio"];
      on_attach = mkLuaInline ''
        function(client, bufnr)
          -- Workaround to trigger reloading JS/TS files
          -- See https://github.com/sveltejs/language-tools/issues/2008
          vim.api.nvim_create_autocmd('BufWritePost', {
            pattern = { '*.js', '*.ts' },
            group = vim.api.nvim_create_augroup('svelte_js_ts_file_watch', {}),
            callback = function(ctx)
              -- internal API to sync changes that have not yet been saved to the file system
              client:notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
            end,
          })

          vim.api.nvim_buf_create_user_command(bufnr, 'LspMigrateToSvelte5', function()
            client:exec_cmd({
              title = 'Migrate Component to Svelte 5 Syntax',
              command = 'migrate_to_svelte_5',
              arguments = { vim.uri_from_bufnr(bufnr) },
            })
          end, { desc = 'Migrate Component to Svelte 5 Syntax' })

          default_on_attach(client, bufnr)
        end
      '';
    };
  };
}

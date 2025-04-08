{pkgs, ...}: {
  config.vim.lsp.lspconfig.sources.json = ''
    lspconfig.jsonls.setup {
      capabilities = capabilities,
      cmd = {
        "${pkgs.vscode-langservers-extracted}/bin/vscode-json-language-server",
        "--stdio"
      },

      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true }
        }
      }
    }
  '';
}

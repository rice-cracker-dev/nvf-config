{pkgs, ...}: {
  config.vim.lsp.lspconfig.sources.emmet-language-server = ''
    lspconfig.emmet_language_server.setup {
      capabilities = capabilities,
      cmd = {
        "${pkgs.emmet-language-server}/bin/emmet-language-server",
        "--stdio"
      },
    }
  '';
}

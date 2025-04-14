{pkgs, ...}: {
  config.vim.lsp.lspconfig.sources.emmet_ls = ''
    lspconfig.emmet_ls.setup {
      capabilities = capabilities,
      cmd = {
        "${pkgs.emmet-ls}/bin/emmet-ls",
        "--stdio"
      },
    }
  '';
}

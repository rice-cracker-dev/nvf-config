{pkgs, ...}: {
  config.vim.lsp.lspconfig.sources.qmlls = ''
    lspconfig.qmlls.setup {
      capabilities = capabilities,
      cmd = {"${pkgs.kdePackages.qtdeclarative}/bin/qmlls", "-E"}
    }
  '';
}

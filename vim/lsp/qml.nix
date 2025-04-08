{pkgs, ...}: {
  config.vim.lsp.lspconfig.sources.qml = ''
    lspconfig.qmlls.setup {
      capabilities = capabilities,
      cmd = {"${pkgs.kdePackages.qtdeclarative}/bin/qmlls", "-E"}
    }
  '';
}

{pkgs, ...}: {
  config.vim.luaConfigRC.lspconfig = ''
    local lspconfig = require("lspconfig")

    lspconfig.qmlls.setup {
      cmd = { "${pkgs.kdePackages.qtdeclarative}/bin/qmlls" }
    }
  '';
}

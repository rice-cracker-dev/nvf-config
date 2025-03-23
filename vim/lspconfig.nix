{pkgs, ...}: {
  config.vim.luaConfigRC.lspconfig = ''
    local lspconfig = require("lspconfig")

    lspconfig.qmlls.setup {
      cmd = {"${pkgs.kdePackages.qtdeclarative}/bin/qmlls", "-E"}
    }

    lspconfig.jsonls.setup {
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

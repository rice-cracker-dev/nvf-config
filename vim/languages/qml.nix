{pkgs, ...}: {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      qmljs
    ];

    lsp.servers.qmlls = {
      cmd = ["${pkgs.kdePackages.qtdeclarative}/bin/qmlls" "-E"];
    };
  };
}

{pkgs, ...}: {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      astro
    ];

    lsp.servers.astro = {
      cmd = ["${pkgs.astro-language-server}/bin/astro-ls" "--stdio"];
    };
  };
}

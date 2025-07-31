{pkgs, ...}: {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      gdscript
    ];

    lsp.servers.gdscript = {};
  };
}

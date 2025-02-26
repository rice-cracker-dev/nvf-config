{pkgs, ...}: {
  config.vim.treesitter = {
    enable = true;
    addDefaultGrammars = true;
    autotagHtml = true;
    fold = true;
    grammars = [
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.typescript
      pkgs.vimPlugins.nvim-treesitter.builtGrammars.qmljs
    ];

    context.enable = true;
    highlight.enable = true;
    indent.enable = true;
  };
}

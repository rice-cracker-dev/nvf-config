{pkgs, ...}: {
  config.vim.treesitter = {
    enable = true;
    addDefaultGrammars = true;
    autotagHtml = true;
    fold = true;
    grammars = [pkgs.vimPlugins.nvim-treesitter.builtGrammars.typescript];

    context.enable = true;
    highlight.enable = true;
    indent.enable = true;
  };
}

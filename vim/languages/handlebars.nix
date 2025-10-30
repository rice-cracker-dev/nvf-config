{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      pug
    ];
  };
}

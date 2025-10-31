{
  pkgs,
  direnv-nvim,
  ...
}: let
  direnv-nvim-plugin = pkgs.vimUtils.buildVimPlugin {
    name = "direnv-nvim";
    src = direnv-nvim;
  };
in {
  config.vim.extraPlugins.direnv-nvim = {
    package = direnv-nvim-plugin;
    setup = "require('direnv').setup({})";
  };
}

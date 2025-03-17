{pkgs, ...}: let
  inherit (pkgs.vimPlugins) vim-be-good;
in {
  config.vim.extraPlugins.vim-be-good = {
    package = vim-be-good;
  };
}

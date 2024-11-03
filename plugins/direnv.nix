{pkgs, ...}: let
  inherit (pkgs.vimPlugins) direnv-vim;
in {
  config.vim.extraPlugins.direnv = {package = direnv-vim;};
}

{pkgs, ...}: let
  inherit (pkgs.vimPlugins) yats-vim;
in {
  config.vim = {
    globals.yats_host_keyword = true;

    extraPlugins.yats-vim = {
      package = yats-vim;
    };
  };
}

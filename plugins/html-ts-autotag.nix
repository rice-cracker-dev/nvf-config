{pkgs, ...}: let
  inherit (pkgs.vimPlugins) nvim-ts-autotag;
in {
  config.vim.extraPlugins.nvim-ts-autotag = {
    package = nvim-ts-autotag;
    setup = ''
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false
        },
      })
    '';
  };
}

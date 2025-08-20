{pkgs, ...}: let
  inherit (pkgs.vimPlugins) lazydev-nvim;
in {
  config.vim.extraPlugins.lazydev = {
    package = lazydev-nvim;
    setup = ''
      require("lazydev").setup({
        enabled = function(root_dir)
          return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
        end,
        library = { { path = "''${3rd}/luv/library", words = { "vim%.uv" } } },
      })
    '';
  };
}

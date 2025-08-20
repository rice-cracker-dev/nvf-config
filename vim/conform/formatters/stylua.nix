{
  pkgs,
  lib,
  ...
}: {
  config.vim.formatter.conform-nvim.setupOpts = {
    formatters.stylua.command = lib.getExe pkgs.stylua;
    formatters_by_ft.lua = ["stylua"];
  };
}

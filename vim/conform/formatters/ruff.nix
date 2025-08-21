{
  pkgs,
  lib,
  ...
}: {
  config.vim.formatter.conform-nvim.setupOpts = {
    formatters.ruff_format.command = lib.getExe pkgs.ruff;
    formatters_by_ft.python = ["ruff_format"];
  };
}

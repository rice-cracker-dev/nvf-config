{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.meta) getExe;
in {
  config.vim.diagnostics.nvim-lint = {
    linters.ruff.cmd = getExe pkgs.ruff;
    linters_by_ft.python = ["ruff"];
  };
}

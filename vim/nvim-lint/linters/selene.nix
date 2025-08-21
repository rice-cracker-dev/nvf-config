{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.meta) getExe;
in {
  config.vim.diagnostics.nvim-lint = {
    linters.selene.cmd = getExe pkgs.selene;
    linters_by_ft.lua = ["selene"];
  };
}

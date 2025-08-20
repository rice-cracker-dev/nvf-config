{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.meta) getExe;
in {
  config.vim.diagnostics.nvim-lint = {
    linters.shellcheck.cmd = getExe pkgs.shellcheck;
    linters_by_ft = {
      sh = ["shellcheck"];
    };
  };
}

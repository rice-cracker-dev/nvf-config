{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.meta) getExe;
in {
  config.vim.diagnostics.nvim-lint = {
    linters.markdownlint-cli2.cmd = getExe pkgs.markdownlint-cli2;
    linters_by_ft = {
      markdown = ["markdownlint-cli2"];
    };
  };
}

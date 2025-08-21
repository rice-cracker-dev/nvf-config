{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.meta) getExe;
in {
  config.vim.diagnostics.nvim-lint = {
    linters.statix.cmd = getExe pkgs.statix;
    linters_by_ft.nix = ["statix"];
  };
}

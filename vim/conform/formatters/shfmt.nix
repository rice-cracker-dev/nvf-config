{
  pkgs,
  lib,
  ...
}: {
  config.vim.formatter.conform-nvim.setupOpts = {
    formatters.shfmt.command = lib.getExe pkgs.shfmt;
    formatters_by_ft.sh = ["shfmt"];
  };
}

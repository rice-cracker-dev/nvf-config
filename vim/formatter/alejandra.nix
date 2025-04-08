{
  pkgs,
  lib,
  ...
}: {
  config.vim.formatter.conform-nvim.setupOpts = {
    formatters.alejandra.command = lib.getExe pkgs.alejandra;
    formatters_by_ft.nix = ["alejandra"];
  };
}

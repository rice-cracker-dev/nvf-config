{lib, ...}: let
  inherit (lib) mkOption;
  inherit (lib.types) attrsOf listOf  str;
in {
  options.vim.diagnostics.nvim-lint = {
    linters_cwd = mkOption {
      type = attrsOf (listOf str);
      default = {};
    };
  };
}

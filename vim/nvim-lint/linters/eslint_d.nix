{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.meta) getExe;
in {
  config.vim.diagnostics.nvim-lint = {
    linters.eslint_d = {
      cmd = getExe pkgs.eslint_d;
      required_files = [
        "eslint.config.js"
        "eslint.config.mjs"
        ".eslintrc"
        ".eslintrc.json"
        ".eslintrc.js"
        ".eslintrc.yml"
      ];
    };

    linters_by_ft = {
      javascript = ["eslint_d"];
      javascriptreact = ["eslint_d"];
      typescript = ["eslint_d"];
      typescriptreact = ["eslint_d"];
      svelte = ["eslint_d"];
      astro = ["eslint_d"];
    };
  };
}
